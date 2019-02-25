namespace :post_mail do
  
  desc "多言語用データ作成＆お知らせをメールで通知する"
  
  task :send => :environment do
    current_time = Time.zone.parse(Time.zone.now.strftime("%Y/%m/%d %H:00:00"))
    Rails.logger.info(current_time)
    posts = Post.where(post_at: current_time)
    
    # slack通知
    notifier = Slack::Notifier.new(Rails.application.config.slack_webhook_url)
    notifier.ping("post mail task ran\n#{current_time}\npost: #{posts.size}件")
    
    posts.each do |post|
      residents = Resident.joins(room: :house).merge(House.where(id: post.houses.ids)).uniq
      languages = residents.map(&:language).uniq - ["ja"]
      posts = {"ja": post}
      languages.each do |lang|
        posts[lang.to_sym] = create_locale_post(post, lang)
      end
      residents.each do |resident|
        locale = resident.language.to_sym
        PostResident.create!(post_id: post.id, resident_id: resident.id)
        ToResidentMailer.post_reached_mail(resident, post, posts[locale]).deliver_now
      end
    end
  end
  
  def create_locale_post(post, lang)
    translated_text = text_translation(post, lang)
    translated_title = Post.text_translate(post.title, "ja", lang)
    fp = ForeignPost.new(
      title: translated_title,
      text: translated_text,
      post_id: post.id,
      language: lang
    )
    fp.save
    fp
  end

  def text_translation(post, target)
    translated = ""
    post.text.split("$end$").map do |part|
      paragraph = part.split("$$")
      info = paragraph[1]
      texts = paragraph[2]
      translated_text = Post.text_translate(texts, "ja", target)
      translated += "$$#{info}$$#{translated_text}$end$"
    end
  end
  
end

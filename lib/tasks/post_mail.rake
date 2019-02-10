namespace :post_mail do
  
  desc "お知らせをメールで通知する"
  
  task :send => :environment do
    current_time = Time.parse(Time.zone.now.strftime("%Y/%m/%d %H:00:00"))
    logger.info(current_time)
    posts = Post.where(post_at: current_time)
    posts.each do |post|
      residents = Resident.joins(room: :house).merge(House.where(id: post.houses.ids)).uniq
      residents.each do |resident|
        ToResidentMailer.post_reached_mail(resident, post).deliver_now
      end
    end
  end

  task :send_check => :environment do
    begin
    ToAdminMailer.mail_running_check.deliver_now
    rescue => e
    p e
    end
  end
end

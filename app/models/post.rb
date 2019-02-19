require "google/cloud/translate"
class Post < ApplicationRecord
    belongs_to :owner
    has_many :post_houses
    has_many :houses, through: :post_houses
    has_many :post_residents
    has_many :residents, through: :post_residents
    has_many :foreign_posts
    
    validates :title, presence: true
    validates :text, presence: true
    validates :post_at, presence: true
    validate :post_at_after_now
    
    def post_at_after_now
        if Time.zone.now >= post_at
            errors.add(:post_at, "は現在時刻以降の日時を指定してください")
        end
    end

    def self.text_translate(text, source, target)
        project_id = OwnerHelper::Application::TRANSLATION_PROJECT_ID

        translate = Google::Cloud::Translate.new project: project_id
        translated_texts = text.split(/\r\n|\n|\r/).map do |t|
          translated = translate.translate t, from: source, to: target
          translated.text
        end
        translated_texts.join("\r\n")
    end
end

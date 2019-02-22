require "google/cloud/translate"

class ContactChat < ApplicationRecord
    belongs_to :contact
    belongs_to :owner, optional: true
    belongs_to :resident, optional: true
    
    has_one_attached :media

    enum read_status: {
        read: 1,  #既読
        yet: 2  # 未読
    }
    
    def owner_write?
        owner_id.present?
    end
    
    def resident_write?
        resident_id.present?
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

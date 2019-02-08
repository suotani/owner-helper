class ContactChat < ApplicationRecord
    belongs_to :contact
    belongs_to :owner, optional: true
    belongs_to :resident, optional: true
    
    validates :text, presence: true
    
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
end

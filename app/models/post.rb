class Post < ApplicationRecord
    belongs_to :owner
    has_many :post_houses
    has_many :houses, through: :post_houses
    has_many :post_residents
    has_many :residents, through: :post_residents
    
    validates :title, presence: true
    validates :text, presence: true
    validates :post_at, presence: true
    validate :post_at_after_now
    
    def post_at_after_now
        if Time.zone.now >= post_at
            errors.add(:post_at, "は現在時刻以降の日時を指定してください")
        end
    end
end

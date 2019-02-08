class Post < ApplicationRecord
    belongs_to :owner
    has_many :post_houses
    has_many :houses, through: :post_houses
    has_many :post_residents
    has_many :residents, through: :post_residents
    
    validates :title, presence: true
end

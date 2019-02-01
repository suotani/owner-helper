class House < ApplicationRecord
  belongs_to :owner
  has_many :rooms
  has_many :post_houses
  has_many :posts, through: :post_houses
  
  validates :name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
end

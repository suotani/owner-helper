class House < ApplicationRecord
  belongs_to :owner
  has_many :rooms
  has_many :post_houses
  has_many :posts, through: :post_houses
  
  validates :name, presence: true, uniqueness: true
  validates :postal_code, presence: true, format: {with: /\A\d{3}[-]\d{4}\z|\A\d{7}\z/ }
  validates :address, presence: true
end

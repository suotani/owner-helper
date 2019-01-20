class House < ApplicationRecord
  belongs_to :owner
  has_many :rooms
  
  validates :name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
end

class Room < ApplicationRecord
  belongs_to :house
  belongs_to :resident, optional: true
  has_many :contacts
  
  validates :number, presence: true, uniqueness: {scope: :house_id}
end

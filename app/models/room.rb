class Room < ApplicationRecord
  belongs_to :house
  belongs_to :resident, optional: true
  has_many :contacts
  belongs_to :contact, optional: true
  
  validates :number, presence: true, uniqueness: {scope: :house_id}
end

class Room < ApplicationRecord
  belongs_to :house
  belongs_to :resident, optional: true
  
  validates :number, presence: true, uniqueness: {scope: :house_id}
end

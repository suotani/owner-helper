class Room < ApplicationRecord
  belongs_to :house
  belongs_to :resident
end

class House < ApplicationRecord
  belongs_to :owner
  has_many :rooms
end

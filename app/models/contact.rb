class Contact < ApplicationRecord
  belongs_to :owner
  belongs_to :room
end

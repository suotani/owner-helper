class Contact < ApplicationRecord
  belongs_to :owner
  belongs_to :room
  belongs_to :resident
  has_many :contact_chats
end

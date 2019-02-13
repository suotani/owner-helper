class Contact < ApplicationRecord
  belongs_to :owner
  belongs_to :room
  belongs_to :resident
  has_many :contact_chats
  
  enum owner_status: {
    owner_no_read: 1,
    owner_read: 2
  }

  enum resident_status: {
    resident_no_read: 1,
    resident_read: 2
  }
  
  def updatable?
    resident == room.resident
  end

end

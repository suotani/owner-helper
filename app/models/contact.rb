class Contact < ApplicationRecord
  belongs_to :owner
  #belongs_to :room
  belongs_to :resident
  has_many :contact_chats


  enum owner_status: {
    owner_new: 1,  # サインアップのみ
    owner_read: 2,  # 入居リクエスト中
    owner_writed: 3   # 入居中
  }

  enum resident_status: {
    resident_new: 1,  # サインアップのみ
    resident_read: 2,  # 入居リクエスト中
    resident_writed: 3   # 入居中
  }
end

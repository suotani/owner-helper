class Resident < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_one :room
  has_many :contacts
  has_many :contact_chats
  has_many :post_residents

  validates :name, presence: true
  
  enum status: {
    signed_up: 1,  # サインアップのみ
    requested: 2,  # 入居リクエスト中
    moving_in: 3   # 入居中
  }
  
  enum post_mail_setting: {
    post_none: 1, #不必要
    post_approval: 2, #許可
  }

  enum contact_mail_setting: {
    contact_none: 1, #不必要
    contact_approval: 2, #許可
  }
  
  def current_contact
    contacts.where(owner_id: room.house.owner_id).first
  end
end

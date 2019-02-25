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
  
  FAMILY_TYPE = [
    "単身(男性)",
    "単身(女性)",
    "ご家族",
    "ご家族（お子様1名以上）",
    "その他"
  ]
  
  LANGUAGE_LIST =[
    ["日本語", "ja"],
    ["English", "en"]
  ]
  
  def current_contact
    room.contact
  end
  
  scope :find_by_id_from_owner, ->(owner_id, resident_id) do
    eager_load(room: :house).merge(House.where(owner_id: owner_id))
                            .find(resident_id)
  end
end

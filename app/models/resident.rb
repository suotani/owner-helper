class Resident < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_one :room
  has_many :contacts

  validates :name, presence: true
  
  enum status: {
    signed_up: 1,  # サインアップのみ
    requested: 2,  # 入居リクエスト中
    moving_in: 3   # 入居中
  }
  
  def current_contact
    contacts.where(owner_id: room.house.owner_id).first
  end
end

class Owner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  
  has_many :houses
  has_many :posts
  has_many :contacts
  has_many :contact_chats

  validates :name, presence: true

  enum contact_mail_setting: {
    contact_none: 1, #不必要
    contact_approval: 2, #許可
    contact_weekday_only: 3 #平日のみ通知する
  }

  enum request_mail_setting: {
    request_none: 1, #不必要
    request_approval: 2, #許可
    request_weekday_only: 3 #平日のみ通知する
  }
  
  def request_mail_accept?
    return false if request_none?
    return false if request_weekday_only? && [0,6].include?(Time.zone.today.wday)
    true
  end

  def contact_mail_accept?
    return false if contact_none?
    return false if contact_weekday_only? && [0,6].include?(Time.zone.today.wday)
    true
  end
end

class House < ApplicationRecord
  belongs_to :owner
  has_many :rooms
  has_many :post_houses
  has_many :posts, through: :post_houses
  has_many :bill_details
  
  validates :name, presence: true, uniqueness: true
  validates :postal_code, presence: true, format: {with: /\A\d{7}\z/ }
  validates :address, presence: true
  
  def current_bill_detail
    bill = Bill.where(year: Time.zone.now.year, month: Time.zone.now.month).first
    bill.bill_details.where(house_id: self.id).first
  end
end

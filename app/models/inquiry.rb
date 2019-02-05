class Inquiry < ApplicationRecord
  belongs_to :owner, optional: true
  belongs_to :resident, optional: true
  
  validates :text, presence: true
  
  enum category: {
    bug: 1, #バグ
    howto: 2, #使い方
    product: 3, #改善要望
    other: 4
  }
end

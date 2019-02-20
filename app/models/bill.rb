class Bill < ApplicationRecord
    belongs_to :owner
    has_many :bill_details
end

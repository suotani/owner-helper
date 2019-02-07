class Post < ApplicationRecord
    belongs_to :owner
    has_many :post_houses
    has_many :houses, through: :post_houses
end

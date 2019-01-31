class PostHouse < ApplicationRecord
    belongs_to :post
    belongs_to :house
end

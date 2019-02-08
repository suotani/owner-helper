class PostResident < ApplicationRecord
    belongs_to :resident
    belongs_to :post
    
    enum read_status: {
        read: 1,
        yet: 2
    }
end

class ContactChat < ApplicationRecord
    belongs_to :contact
    belongs_to :owner, optional: true
    belongs_to :resident, optional: true
end

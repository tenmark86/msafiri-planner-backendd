class PackingItem < ApplicationRecord
    belongs_to :trip
    validates :item, presence: true
end

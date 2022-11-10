class ItineraryItem < ApplicationRecord
    belongs_to :trip
    validates :description, presence: true
end

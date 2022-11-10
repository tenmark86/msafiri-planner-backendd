class TripSerializer < ActiveModel::Serializer
  attributes :id, :destination, :end_date, :start_date

  has_many :packing_items
  has_many :itinerary_items
end

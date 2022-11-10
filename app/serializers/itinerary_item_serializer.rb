class ItineraryItemSerializer < ActiveModel::Serializer
  attributes :id, :trip_id, :description
end

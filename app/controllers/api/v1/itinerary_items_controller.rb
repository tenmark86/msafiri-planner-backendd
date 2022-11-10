class Api::V1::ItineraryItemsController < ApplicationController

    before_action :find_trip

    def index 
        @itinerary_items = @trip.itinerary_items
        render json: @itinerary_items
    end

    def create
        # binding.pry
        @itinerary_item = @trip.itinerary_items.build(itinerary_item_params)
        @itinerary_item.save
        # @itinerary_item = @trip.itinerary_items.new(itinerary_item_params)
        render json: @trip
    end

    def show 
        @itinerary_item = ItineraryItem.find(params[:id])
        render json: @itinerary_item
    end

    def destroy 
        itinerary_item = @trip.itinerary_items.find_by(id: params[:id])
        itinerary_item.destroy
        trip2 = Trip.find(itinerary_item.trip_id)
        render json: trip2
    end

    private

    def find_trip
        @trip = Trip.find(params[:trip_id])
    end

    def itinerary_item_params 
        params.require(:itinerary_item).permit(:description, :trip_id)
    end

end

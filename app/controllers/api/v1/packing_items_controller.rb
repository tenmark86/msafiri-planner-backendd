class Api::V1::PackingItemsController < ApplicationController

    before_action :find_trip

    def index 
        @packing_items = @trip.packing_items
        render json: @packing_items
    end

    def create
        # binding.pry
        @packing_item = @trip.packing_items.build(packing_item_params)
        @packing_item.save
        render json: @trip
    end

    def show 
        # @packing_item = @trip.packing_items.find_by(id: params[:id])
        @packing_item = PackingItem.find(params[:id])
        render json: @packing_item
    end

    def destroy 
        packing_item = @trip.packing_items.find_by(id: params[:id])
        packing_item.destroy
        trip2 = Trip.find(packing_item.trip_id)
        render json: trip2
    end

    private

    def find_trip
        @trip = Trip.find(params[:trip_id])
    end

    def packing_item_params 
        params.require(:packing_item).permit(:item, :trip_id)
    end

end

class CreateItineraryItems < ActiveRecord::Migration[6.1]
  def change
    create_table :itinerary_items do |t|
      t.integer :trip_id
      t.text :description

      t.timestamps
    end
  end
end

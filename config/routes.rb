Rails.application.routes.draw do

  root 'welcome#index'

namespace :api do
    namespace :v1 do
      resources :trips do
        resources :itinerary_items
        resources :packing_items
        #can only access itinerary/packing items nested in a trip id
      end
    end
  end
end



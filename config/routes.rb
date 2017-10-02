Rails.application.routes.draw do
  namespace 'api' do
  		resources :truckers
  		resources :shipments
  		put '/truckers/:id/last_location', to: "truckers#last_location"
  		get '/shipments/:id/nearby_truckers', to: "shipments#nearby_truckers"
  end
end

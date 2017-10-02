Rails.application.routes.draw do
  namespace 'api' do
  		resources :truckers
  		put '/truckers/:id/last_location', to: "truckers#last_location"
  end
end

Rails.application.routes.draw do

namespace 'api' do
	resources :shipments
	resources :truckers
end

end

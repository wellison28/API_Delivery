require "rails_helper"

RSpec.describe "rotas para Truckers", type: :routing do
    it "rotas para #create" do
      expect(:post => "api/truckers").to route_to("api/truckers#create")
    end

    it "routes /widgets to the widgets controller" do
      expect(:put => "/api/truckers/id/last_location").
      to route_to(:controller => "api/truckers", :action => "last_location", :id => "id")
    end
end

RSpec.describe "rotas para shipments", :type => :routing do
    it "rota /api/shipments/:id para o controller shipments" do
      expect(:get => "/api/shipments/id").to route_to("api/shipments#show", :id => "id")
    end

    it "rota /api/shipments/:id/nearby_truckers para o controller shipments" do
      expect(:get => "/api/shipments/id/nearby_truckers").
      to route_to("api/shipments#nearby_truckers", :id => "id")
    end

    it "rota /api/shipments para o controller shipments" do
      expect(:post => "/api/shipments").to route_to("api/shipments#create")
    end
end

    # it "routes to #show" do
    #   expect(:get => "/users/1").to route_to("users#show", :id => "1")
    # end


    # it "routes to #create" do
    #   expect(:post => "/users").to route_to("users#create")
    # end

    # it "routes to #update via PUT" do
    #   expect(:put => "/users/1").to route_to("users#update", :id => "1")
    # end

    # it "routes to #update via PATCH" do
    #   expect(:patch => "/users/1").to route_to("users#update", :id => "1")
    # end

    # it "routes to #destroy" do
    #   expect(:delete => "/users/1").to route_to("users#destroy", :id => "1")
    # end


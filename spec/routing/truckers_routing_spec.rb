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

require 'rails_helper'

RSpec.describe "Truckers Controller", type: :request do

  it "create trucker" do
    post "/api/truckers", :params => {
                            "trucker": {
                                "name": "Lincoln Falcão",
                                "phone": "(11) 97654-3210",
                                "vehicle": {
                                    "type": "Truck",
                                    "body_type": "Baú"
                                }
                            }
                          }

    expect(response).to have_http_status(201)
  end

  it "Edit trucker" do
    vehicle = Vehicle.create(vtype:"Truck", body_type:"Sider")
    trucker = Trucker.create(name: "Wellison", phone:"(11)9552-7263", vehicle: vehicle)

    put "/api/truckers/#{trucker.id}/last_location", 
    :params =>  {
                  "location": {
                    "city": "Rio Branco",
                    "state": "AC"
                  }
                }

    expect(response).to have_http_status(204)
  end
end

RSpec.describe "Shipments Controller", type: :request do

  it "create shipment" do
    post "/api/shipments", 
    :params => {
                  "shipment": {
                    "value": 1500.0,
                    "weight_kg": 2000,
                    "contact": {
                      "name": "Carlos", "phone": "(11) 98268-4321"
                    },
                    "vehicles": [
                      {"type": "Truck", "body_type": "Baú"},
                      {"type": "Truck", "body_type": "Sider"}
                    ], 
                    "origin": {"city": "São Paulo", "state": "SP", 
                               "load_at": "2017-09-25"},
                    "destination": {"city": "Goiânia", "state": "GO", 
                                    "deliver_at": "2017-09-29"}
                  }
                }

    expect(response).to have_http_status(201)
  end
end

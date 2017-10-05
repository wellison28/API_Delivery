class AddVehicleToShipmentVehicles < ActiveRecord::Migration[5.1]
  def change
    add_reference :shipment_vehicles, :vehicle, foreign_key: true
  end
end

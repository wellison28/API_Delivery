class RemoveColumnsToShipmentVehicles < ActiveRecord::Migration[5.1]
  def change
    remove_column :shipment_vehicles, :vtype, :string
    remove_column :shipment_vehicles, :body_type, :string
  end
end

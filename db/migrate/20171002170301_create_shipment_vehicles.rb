class CreateShipmentVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :shipment_vehicles do |t|
      t.string :vtype
      t.string :body_type
      t.references :shipment, foreign_key: true

      t.timestamps
    end
  end
end

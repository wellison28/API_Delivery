class CreateShipments < ActiveRecord::Migration[5.1]
  def change
    create_table :shipments do |t|
      t.double :value
      t.integer :weight_kg
      t.references :contact, foreign_key: true
      t.references :origin, foreign_key: true
      t.references :destination, foreign_key: true

      t.timestamps
    end
  end
end

class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles do |t|
      t.string :vtype
      t.string :body_type

      t.timestamps
    end
  end
end

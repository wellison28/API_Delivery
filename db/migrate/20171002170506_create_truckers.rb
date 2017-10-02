class CreateTruckers < ActiveRecord::Migration[5.1]
  def change
    create_table :truckers do |t|
      t.string :name
      t.string :phone
      t.string :last_city
      t.string :last_state
      t.references :vehicle, foreign_key: true

      t.timestamps
    end
  end
end

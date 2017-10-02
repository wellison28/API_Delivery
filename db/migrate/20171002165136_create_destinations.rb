class CreateDestinations < ActiveRecord::Migration[5.1]
  def change
    create_table :destinations do |t|
      t.string :city
      t.string :state
      t.date :deliver_at

      t.timestamps
    end
  end
end

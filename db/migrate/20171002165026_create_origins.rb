class CreateOrigins < ActiveRecord::Migration[5.1]
  def change
    create_table :origins do |t|
      t.string :city
      t.string :state
      t.date :load_at

      t.timestamps
    end
  end
end

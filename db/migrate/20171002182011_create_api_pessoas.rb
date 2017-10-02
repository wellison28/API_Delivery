class CreateApiPessoas < ActiveRecord::Migration[5.1]
  def change
    create_table :api_pessoas do |t|
      t.string :name

      t.timestamps
    end
  end
end

class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.integer :owner_id
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end

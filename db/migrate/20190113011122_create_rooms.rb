class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer :house_id
      t.string :number
      t.integer :resident_id

      t.timestamps
    end
  end
end

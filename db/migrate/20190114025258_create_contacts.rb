class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.integer :room_id
      t.integer :owner_id

      t.timestamps
    end
  end
end

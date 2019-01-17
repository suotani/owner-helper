class CreateDemos < ActiveRecord::Migration[5.2]
  def change
    create_table :demos do |t|
      t.string :name
      t.integer :owner_id

      t.timestamps
    end
  end
end

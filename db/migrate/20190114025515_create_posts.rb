class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :Owner_id
      t.text :text

      t.timestamps
    end
  end
end

class CreatePostHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :post_houses do |t|
      t.integer :post_id

      t.timestamps
    end
  end
end

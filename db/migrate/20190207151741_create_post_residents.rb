class CreatePostResidents < ActiveRecord::Migration[5.2]
  def change
    create_table :post_residents do |t|
      t.integer :post_id
      t.integer :resident_id
      t.boolean :read

      t.timestamps
    end
  end
end

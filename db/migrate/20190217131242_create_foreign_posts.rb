class CreateForeignPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :foreign_posts do |t|
      t.string :title
      t.text :text
      t.integer :post_id
      t.string :language

      t.timestamps
    end
  end
end

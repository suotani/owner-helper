class AddColumnTitleToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :title, :string
    add_column :posts, :post_at, :datetime
  end
end

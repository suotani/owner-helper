class AddColumnEndAtToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :end_at, :datetime
    add_column :posts, :end_option, :integer
    add_column :posts, :deleted, :boolean, default: false
  end
end

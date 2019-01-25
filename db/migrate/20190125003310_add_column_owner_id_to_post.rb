class AddColumnOwnerIdToPost < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :Owner_id, :integer
    add_column :posts, :owner_id, :integer
  end
end

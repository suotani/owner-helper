class AddColumnResidentIdToContact < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :resident_id, :integer
    remove_column :posts, :room_id, :integer
  end
end

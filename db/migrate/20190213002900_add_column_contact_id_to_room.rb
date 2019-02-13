class AddColumnContactIdToRoom < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :contact_id, :integer
  end
end

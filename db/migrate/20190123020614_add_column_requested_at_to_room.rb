class AddColumnRequestedAtToRoom < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :requested_at, :datetime
  end
end

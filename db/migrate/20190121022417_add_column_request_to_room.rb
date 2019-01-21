class AddColumnRequestToRoom < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :request, :boolean
  end
end

class AddColumnReadStatusToPostResident < ActiveRecord::Migration[5.2]
  def change
    remove_column :post_residents, :read, :boolean
    add_column :post_residents, :read_status, :integer, default: 2
  end
end

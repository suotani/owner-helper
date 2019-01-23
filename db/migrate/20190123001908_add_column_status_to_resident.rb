class AddColumnStatusToResident < ActiveRecord::Migration[5.2]
  def change
    add_column :residents, :status, :integer, default: 1
  end
end

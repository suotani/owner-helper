class AddColumnNameToResident < ActiveRecord::Migration[5.2]
  def change
    add_column :residents, :name, :string
  end
end

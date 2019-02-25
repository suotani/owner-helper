class AddColumnResidentNameToRoom < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :resident_name, :string
    add_column :rooms, :resident_phone_number, :string
  end
end

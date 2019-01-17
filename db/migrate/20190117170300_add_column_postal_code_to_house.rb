class AddColumnPostalCodeToHouse < ActiveRecord::Migration[5.2]
  def change
    add_column :houses, :postal_code, :string, limit: 7
  end
end

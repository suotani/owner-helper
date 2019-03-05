class ChangeColumnPriceToHouse < ActiveRecord::Migration[5.2]
  def change
    change_column :houses, :price, :integer, default: 300
  end
end

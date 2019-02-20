class AddColumnPriceToHouse < ActiveRecord::Migration[5.2]
  def change
    add_column :houses, :price, :integer
    add_column :rooms, :moved_at, :datetime
    add_column :rooms, :leave_at, :datetime
  end
end

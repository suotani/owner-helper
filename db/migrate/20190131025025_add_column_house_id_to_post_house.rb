class AddColumnHouseIdToPostHouse < ActiveRecord::Migration[5.2]
  def change
    add_column :post_houses, :house_id, :integer
  end
end

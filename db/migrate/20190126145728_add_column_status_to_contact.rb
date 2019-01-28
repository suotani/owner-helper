class AddColumnStatusToContact < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :owner_status, :integer, default: 1
    add_column :contacts, :resident_status, :integer, default: 1
  end
end

class AddColumnStatusToContact < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :owner_status, :integer, default: 2
    add_column :contacts, :resident_status, :integer, default: 2
  end
end

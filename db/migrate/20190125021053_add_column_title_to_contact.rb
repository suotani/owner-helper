class AddColumnTitleToContact < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :title, :string
  end
end

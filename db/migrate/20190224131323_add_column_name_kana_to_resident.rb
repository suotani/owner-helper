class AddColumnNameKanaToResident < ActiveRecord::Migration[5.2]
  def change
    add_column :residents, :name_kana, :string
    add_column :rooms, :resident_name_kana, :string
  end
end

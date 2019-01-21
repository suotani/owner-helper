class AddColumnPhoneNumberToResident < ActiveRecord::Migration[5.2]
  def change
    add_column :residents, :phone_number, :string
    add_column :residents, :family, :string
  end
end

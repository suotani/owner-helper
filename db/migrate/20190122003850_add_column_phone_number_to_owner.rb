class AddColumnPhoneNumberToOwner < ActiveRecord::Migration[5.2]
  def change
    add_column :owners, :phone_number, :string
    add_column :owners, :response_time, :string
  end
end

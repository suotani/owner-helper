class AddColumnPayTokenToOwner < ActiveRecord::Migration[5.2]
  def change
    add_column :owners, :pay_token, :string
    add_column :owners, :pay_customer_id, :string
  end
end

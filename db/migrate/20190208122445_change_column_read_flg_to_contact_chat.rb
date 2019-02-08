class ChangeColumnReadFlgToContactChat < ActiveRecord::Migration[5.2]
  def change
    remove_column :contact_chats, :readFlg, :boolean
    add_column :contact_chats, :read_status, :integer, default: 2
  end
end

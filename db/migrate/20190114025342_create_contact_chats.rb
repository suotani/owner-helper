class CreateContactChats < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_chats do |t|
      t.integer :contact_id
      t.text :text
      t.boolean :readFlg
      t.integer :owner_id
      t.integer :resident_id

      t.timestamps
    end
  end
end

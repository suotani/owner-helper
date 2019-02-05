class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries do |t|
      t.integer :owner_id
      t.integer :resident_id
      t.text :text
      t.string :email
      t.integer :category

      t.timestamps
    end
  end
end

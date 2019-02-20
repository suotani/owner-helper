class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.integer :owner_id
      t.integer :year
      t.integer :month
      t.integer :amount

      t.timestamps
    end
  end
end

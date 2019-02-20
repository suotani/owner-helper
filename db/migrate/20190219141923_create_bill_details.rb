class CreateBillDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :bill_details do |t|
      t.integer :bill_id
      t.integer :house_id
      t.integer :moving_count
      t.integer :moving_amount
      t.integer :leave_count, default: 0
      t.integer :new_moving_count, default: 0
      t.integer :days_amount
      t.integer :total_amount

      t.timestamps
    end
  end
end

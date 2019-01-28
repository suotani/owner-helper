class AddColumnLastWroteAtToContact < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :last_wrote_at, :datetime
  end
end

class AddColumnContactMailSettingToOwner < ActiveRecord::Migration[5.2]
  def change
    add_column :owners, :contact_mail_setting, :integer, default: 2
    add_column :owners, :request_mail_setting, :integer, default: 2
    
  end
end

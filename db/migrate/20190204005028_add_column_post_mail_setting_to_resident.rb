class AddColumnPostMailSettingToResident < ActiveRecord::Migration[5.2]
  def change
    add_column :residents, :post_mail_setting, :integer, default: 2
    add_column :residents, :contact_mail_setting, :integer, default: 2
    
  end
end

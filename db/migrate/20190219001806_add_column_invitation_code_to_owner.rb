class AddColumnInvitationCodeToOwner < ActiveRecord::Migration[5.2]
  def change
    add_column :owners, :invitation_code, :string
  end
end

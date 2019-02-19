class AddColumnInvitationOwnerIdToOwner < ActiveRecord::Migration[5.2]
  def change
    add_column :owners, :invitation_owner_id, :integer
  end
end

class AddUsedAtToInvitations < ActiveRecord::Migration[6.0]
  def change
    add_column :invitations, :used_at, :timestamp
  end
end

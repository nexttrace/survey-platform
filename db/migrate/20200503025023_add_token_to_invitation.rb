class AddTokenToInvitation < ActiveRecord::Migration[6.0]
  def change
    add_column :invitations, :token, :string, null: false
  end
end

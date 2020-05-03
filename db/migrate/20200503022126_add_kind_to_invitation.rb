class AddKindToInvitation < ActiveRecord::Migration[6.0]
  def change
    add_column :invitations, :kind, :string, null: false
  end
end

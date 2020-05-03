class AddTokenToInvitation < ActiveRecord::Migration[6.0]
  def change
    change_table :invitations do |t|
      t.string :token, null: false
      t.index :token, unique: true
    end
  end
end

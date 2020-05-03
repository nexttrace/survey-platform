class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.string :sent_via
      t.string :sent_to
      t.belongs_to :contact, null: false, foreign_key: true

      t.timestamps
    end
  end
end

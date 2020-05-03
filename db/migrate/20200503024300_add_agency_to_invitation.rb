class AddAgencyToInvitation < ActiveRecord::Migration[6.0]
  def change
    change_table :invitations do |t|
      t.belongs_to :agency, null: false, foreign_key: true
    end
  end
end

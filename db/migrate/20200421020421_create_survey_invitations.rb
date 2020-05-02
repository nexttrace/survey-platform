class CreateSurveyInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :survey_invitations do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.belongs_to :agency, null: false, foreign_key: true

      t.timestamps
    end
  end
end

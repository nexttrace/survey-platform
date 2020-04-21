class AddTokenToSurveyInvitations < ActiveRecord::Migration[6.0]
  def change
    add_column :survey_invitations, :token, :string
    add_index :survey_invitations, :token, unique: true
  end
end

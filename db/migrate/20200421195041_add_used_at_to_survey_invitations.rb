class AddUsedAtToSurveyInvitations < ActiveRecord::Migration[6.0]
  def change
    add_column :survey_invitations, :used_at, :timestamp
  end
end

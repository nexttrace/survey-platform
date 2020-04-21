class FixSurveyInvitationUniqueness < ActiveRecord::Migration[6.0]
  def change
    change_table :survey_invitations do |t|
      t.index :email, unique: true
      t.index :phone, unique: true
    end
  end
end

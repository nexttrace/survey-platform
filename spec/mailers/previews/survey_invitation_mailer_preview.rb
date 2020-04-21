# Preview all emails at http://localhost:3000/rails/mailers/survey_invitation_mailer
class SurveyInvitationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/survey_invitation_mailer/notification_email
  def notification_email
    SurveyInvitationMailer.notification_email
  end

  # Preview this email at http://localhost:3000/rails/mailers/survey_invitation_mailer/contact_email
  def contact_email
    SurveyInvitationMailer.contact_email
  end

end

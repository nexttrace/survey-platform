class SurveyInvitationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.survey_invitation_mailer.notification_email.subject
  #
  def notification_email
    @survey_invitation = params.fetch(:survey_invitation)
    @agency = @survey_invitation.agency

    mail to: @survey_invitation.email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.survey_invitation_mailer.contact_email.subject
  #
  def contact_email
    @survey_invitation = params.fetch(:survey_invitation)
    @agency = @survey_invitation.agency

    mail to: @survey_invitation.email
  end
end

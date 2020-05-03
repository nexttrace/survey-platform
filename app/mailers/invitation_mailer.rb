class InvitationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invitation_mailer.test_result.subject
  #
  def test_result
    @invitation = params.fetch(:invitation)
    @survey_url = contacts.token_sign_in_url(@invitation.token)
    mail to: @invitation.sent_to
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invitation_mailer.contact_notice.subject
  #
  def contact_notice
    @invitation = params.fetch(:invitation)
    @agency = @invitation.agency

    mail to: @invitation.email
  end
end

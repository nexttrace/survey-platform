class InvitationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invitation_mailer.notification_email.subject
  #
  def notification_email
    @invitation = params.fetch(:invitation)
    @agency = @invitation.agency

    mail to: @invitation.email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invitation_mailer.contact_email.subject
  #
  def contact_email
    @invitation = params.fetch(:invitation)
    @agency = @invitation.agency

    mail to: @invitation.email
  end
end

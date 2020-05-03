# Preview all emails at http://localhost:3000/rails/mailers/invitation_mailer
class InvitationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/invitation_mailer/notification_email
  def notification_email
    InvitationMailer.notification_email
  end

  # Preview this email at http://localhost:3000/rails/mailers/invitation_mailer/contact_email
  def contact_email
    InvitationMailer.contact_email
  end

end

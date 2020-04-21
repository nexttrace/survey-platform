class ApplicationMailer < ActionMailer::Base
  default from: "notification@nexttrace.org"
  layout "mailer"
end

class ApplicationTexter < Textris::Base
  include Rails.application.routes.url_helpers

  default from: "NextTrace <#{Rails.configuration.twilio_phone_number}>"
end

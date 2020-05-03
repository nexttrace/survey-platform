class ApplicationTexter < Textris::Base
  default from: "NextTrace <#{Rails.configuration.twilio_phone_number}>"
end

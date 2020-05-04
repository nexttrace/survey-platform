class ApplicationTexter < Textris::Base
  default from: "NextTrace <#{Rails.configuration.twilio_phone_number}>"

  include Rails.application.routes.url_helpers

  define_method Passwordless.mounted_as do
    Passwordless::Engine.routes.url_helpers
  end

end

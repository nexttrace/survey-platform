class ApplicationTexter < Textris::Base

  # Manually expose Passwordless routes, for some reason they are
  # exposed inside Mailers but not exposed inside Texters
  define_method Passwordless.mounted_as do
    Passwordless::Engine.routes.url_helpers
  end

  default from: "NextTrace <#{Rails.configuration.twilio_phone_number}>"
end

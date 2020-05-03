Twilio.configure do |config|
  config.account_sid = ENV["TWILIO_ACCOUNT_SID"]
  config.auth_token  = ENV["TWILIO_AUTH_TOKEN"]
end

if Twilio.auth_token
  Rails.configuration.twilio_phone_number = ENV.fetch("TWILIO_PHONE_NUMBER")
end

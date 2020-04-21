require "ostruct"

account_sid = ENV["TWILIO_ACCOUNT_SID"]
auth_token  = ENV["TWILIO_AUTH_TOKEN"]
enabled = (account_sid && auth_token) ? true : false
twilio = OpenStruct.new(enabled?: enabled)

Rails.application.configure do
  config.twilio = twilio
end

if twilio.enabled?
  require "twilio-ruby"
  twilio.client = Twilio::REST::Client.new(account_sid, auth_token)
  twilio.phone_number = ENV.fetch("TWILIO_PHONE_NUMBER")
end

twilio.freeze

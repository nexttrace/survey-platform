# to_prepare will run per request in dev and run once at boot in prod
Rails.application.config.to_prepare do
  Passwordless.default_from_address = "survey@nexttrace.org"
  Passwordless.success_redirect_path = "/survey"
  Passwordless.restrict_token_reuse = true
  Passwordless.expires_at = lambda { 1.week.from_now } # session length
  Passwordless.timeout_at = lambda { 1.hour.from_now } # magic link validity

  Passwordless.after_session_save = lambda do |session, request|
    case session.authenticatable.found_by
    when "email"
      Passwordless::Mailer.magic_link(session).deliver_now
    when "phone"
      Passwordless::Texter.magic_link(session).deliver_now
    else
      raise "oh no, how did we get here"
    end
  end
end

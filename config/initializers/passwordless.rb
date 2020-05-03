Passwordless.default_from_address = "survey@nexttrace.org"
Passwordless.success_redirect_path = "/survey"
Passwordless.restrict_token_reuse = true
Passwordless.expires_at = lambda { 1.week.from_now } # session length
Passwordless.timeout_at = lambda { 1.hour.from_now } # magic link validity

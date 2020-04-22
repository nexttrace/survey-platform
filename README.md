# NextTrace

Automated contact tracing for public health agencies.

### Dependencies

- Postgres credentials (to store data)
- Twilio credentials (for SMS messaging)
- SendGrid credentials (for outgoing email)

### Setup

- Install the latest Ruby. If you don't have a preferred ruby manager:
  - Run `brew install chruby`
  - Follow the `chruby` setup instructions printed by homebrew
  - Run `brew install ruby-install`
  - Run `ruby-install ruby $(cat .ruby-version)`
  - Run `chruby $(cat .ruby-version)`
- Run `bin/setup`

**Optional**

- Run `brew install puma/puma/puma-dev` to install [puma-dev](https://github.com/puma/puma-dev)
- Run `sudo puma-dev -setup; puma-dev -install; puma-dev link` to set it up
- Develop the site at [nexttrace.test](https://nexttrace.test) with valid SSL

### Usage

1. Sign up a public health agency, like the Gotham City Public Health Agency.
2. Request contact tracing for someone, with their email and/or phone number.
3. See emails and SMSes ask them to take the survey.
4. Collect contacts from the person's survey, and automatically go to 2.

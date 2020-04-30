source "https://rubygems.org"
ruby Pathname.new(".ruby-version").expand_path(__dir__).read.gsub("ruby-", "")

gem "rails", "~> 6.0.2", ">= 6.0.2.2"

gem "bootsnap", ">= 1.4.2", require: false
gem "city-state", "~> 0.1.0"
gem "devise", "~> 4.7"
gem "nilify_blanks", "~> 1.4"
gem "passwordless", "~> 0.9.0"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 4.1"
gem "turbolinks", "~> 5"
gem "twilio-ruby", "~> 5.34"
gem "webpacker", "~> 5.1"

group :development, :test do
  gem "annotate", "~> 3.1"
  gem "dotenv-rails", "~> 2.7"
  gem "pry-byebug", "~> 3.9"
  gem "rspec-rails", "~> 4.0"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.3"
  gem "spring", "~> 2.1"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
  gem "letter_opener", "~> 1.7"
end

gem "sendgrid-actionmailer", "~> 3.0"

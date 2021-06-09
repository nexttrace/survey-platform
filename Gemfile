source "https://rubygems.org"
ruby Pathname.new(".ruby-version").expand_path(__dir__).read.gsub("ruby-", "")

gem "rails", "~> 6.0.3"

gem "bootsnap", ">= 1.4.2", require: false
gem "city-state", "~> 0.1.0"
gem "devise", "~> 4.7"
gem "nilify_blanks", "~> 1.4"
gem "passwordless", "~> 0.9.0"
gem "pg", ">= 0.18", "< 2.0"
gem "phony_rails", "~> 0.14.13"
gem "puma", "~> 4.1"
gem "sendgrid-actionmailer", "~> 3.0"
gem "textris", "~> 0.7.1", github: "indirect/textris" # fork for Rails 6 compat
gem "turbolinks", "~> 5"
gem "twilio-ruby", "~> 5.33"
gem "webpacker", "~> 5.1"

group :production do
  gem "lograge", "~> 0.11.2"
  gem "stackdriver", "~> 0.16.1"
  # Force build stackdriver deps from source via platform, binary gems broken on Alpine
  gem "google-protobuf", "~> 3.17.3", platform: [:ruby]
  gem "grpc",            "~> 1.28", platform: [:ruby]
end

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

# Temporary until gems fix their Ruby 2.7 deprecation warnings
Warning[:deprecated] = false
Warning[:experimental] = false

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.
require 'bootsnap/setup' # Speed up boot time by caching expensive operations.

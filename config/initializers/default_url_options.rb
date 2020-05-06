options = {
  protocol: Rails.application.config.force_ssl ? "https" : "http",
}

case Rails.env
when "production"
  if ENV.has_key?("ASSET_COMPILATION")
    options[:host] = ENV.fetch("DEFAULT_URL_HOST", "asset-compilation.example.com")
  else
    options[:host] = ENV.fetch("DEFAULT_URL_HOST")
  end
when "test"
  options[:host] = "nexttrace.test"
when "development"
  if ENV.has_key?("DEFAULT_URL_HOST")
    options[:host] = ENV.fetch("DEFAULT_URL_HOST")
  else
    options[:host] = "localhost"
    options[:port] = "3000"
  end
else
  raise "unknown environment"
end

# hosts have to be added now because they are used elsewhere immediately
Rails.application.config.tap do |config|
  config.primary_host = options[:host] # not Rails config, just for us later

  config.hosts << options[:host] unless config.hosts.include?(options[:host])

  config.action_mailer.default_url_options ||= {}
  config.action_mailer.default_url_options.merge!(options)

  config.action_controller.default_url_options ||= {}
  config.action_controller.default_url_options.merge!(options)
end

# routes aren't available until `after_initialize`
Rails.application.config.after_initialize do |app|
  app.routes.default_url_options.merge!(options)

  Passwordless::Engine.configure do |engine|
    engine.routes.default_url_options.merge!(Rails.application.routes.default_url_options)
  end
end

# ApplicationController.renderer isn't available until `to_prepare`
Rails.application.config.to_prepare do
  ApplicationController.renderer.defaults.merge!(
    http_host: options[:host],
    https: options[:protocol] == "https",
  )
end

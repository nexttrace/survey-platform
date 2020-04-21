options = {
  protocol: Rails.application.config.force_ssl ? "https" : "http",
}

case Rails.env
when "production"
  options[:host] = ENV.fetch("DEFAULT_URL_HOST")
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

Rails.application.tap do |app|
  app.routes.default_url_options.merge!(options)

  app.config.action_mailer.default_url_options ||= {}
  app.config.action_mailer.default_url_options.merge!(options)

  app.config.action_controller.default_url_options ||= {}
  app.config.action_controller.default_url_options.merge!(options)

  app.config.hosts << options[:host] unless app.config.hosts.include?(options[:host])
end

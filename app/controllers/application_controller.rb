class ApplicationController < ActionController::Base

private

  # agency devise auth helpers
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || agency_dashboard_path
  end

  # non-user stuff
  def twilio
    Rails.application.config.twilio
  end

end

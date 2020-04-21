class ApplicationController < ActionController::Base

private

  # agency auth helpers
  def require_organization!
    authenticate_user! && @organization = current_user.organization
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || dashboard_path
  end

  # non-user stuff
  def twilio
    Rails.application.config.twilio
  end

end

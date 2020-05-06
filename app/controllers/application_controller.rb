class ApplicationController < ActionController::Base

  helper_method def passwordless
    @passwordless ||= Struct.new(:controller).new(self).instance_eval do
      extend Forwardable
      def_delegator :controller, :request
      def_delegator :controller, :session
      def_delegator :controller, :reset_session
      extend Passwordless::ControllerHelpers
    end
  end

  # survey taker helpers
  helper_method def current_contact
    @current_contact ||= passwordless.authenticate_by_session(Contact)
  end

private

  def require_contact!
    return if current_contact
    redirect_to contacts.sign_in_path, flash: { error: "You need a new link to take the survey" }
  end

  # agency devise auth helpers
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || agency_dashboard_path
  end

  # suppress 404 raised exceptions, log requests instead
  def route_not_found
    render 'error_pages/404', status: :not_found
  end

end

class ContactsController < ApplicationController
  include Passwordless::ControllerHelpers

  helper_method :current_contact

private

  # survey taker helpers
  def current_contact
    @current_contact ||= authenticate_by_session(Contact)
  end

  def require_contact!
    return if current_contact
    redirect_to contacts.sign_in_path, flash: { error: "You need to be invited to take the survey" }
  end

end

class RespondentController < ApplicationController
  include Passwordless::ControllerHelpers

  helper_method :current_respondent

private

  # survey respondent helpers
  def current_respondent
    @current_respondent ||= authenticate_by_session(Respondent)
  end

  def require_respondent!
    return if current_respondent
    redirect_to respondents.sign_in_path, flash: { error: "You need to be invited to take the survey" }
  end

end

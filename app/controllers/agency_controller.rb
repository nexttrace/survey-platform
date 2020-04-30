class AgencyController < ApplicationController
  before_action :require_organization!

private

  def require_organization!
    authenticate_user! && @organization = current_user.organization
  end

end

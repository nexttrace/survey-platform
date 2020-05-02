class AgencyController < ApplicationController
  before_action :require_agency!

private

  def require_agency!
    authenticate_user! && @agency = current_user.agency
  end

end

class CodesController < ApplicationController
  before_action :require_no_contact!

  def show
    @invitation = Invitation.unused.find_by_token!(params[:id])

    Invitation.transaction do
      @invitation.update!(used_at: Time.now)

      @survey = Survey.create!(
        agency: @invitation.agency,
        contact: @invitation.contact,
      )

      passwordless.sign_in @invitation.contact
    end

    redirect_to survey_path
  rescue ActiveRecord::RecordNotFound
    redirect_to survey_path, alert: 'That link has expired. Send yourself a new link.'
  end

private

  def require_no_contact!
    return redirect_to survey_path if current_contact
  end

end

class CodesController < ContactsController
  def show
    @invitation = Invitation.unused.find_by_token(params[:id])

    Invitation.transaction do
      @invitation.update!(used_at: Time.now)

      @survey = Survey.create!(
        agency: @invitation.agency,
        contact: @invitation.contact,
      )

      sign_in @invitation.contact
    end

    redirect_to survey_path
  end
end

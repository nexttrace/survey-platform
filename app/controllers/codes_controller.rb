class CodesController < ContactsController

  def show
    @invitation = Invitation.unused.find_by_token!(params[:id])

    Invitation.transaction do
      @invitation.update!(used_at: Time.now)

      @contact = Contact.create!(
        name: @invitation.name,
        email: @invitation.email,
        phone: @invitation.phone,
        invitation: @invitation,
        agency: @invitation.agency,
      )
      sign_in @contact

      @survey = Survey.create!(
        agency: @invitation.agency,
        contact: @contact
      )
    end

    redirect_to survey_path
  end

end

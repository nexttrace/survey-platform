class Agency::InvitationsController < AgencyController
  before_action :require_agency!
  before_action :set_invitation, only: [:show, :edit, :update, :destroy]

  # GET /invitations
  def index
    @invitations = @agency.invitations.all
  end

  # GET /invitations/1
  def show
    redirect_to edit_agency_invitation_path(@invitation)
  end

  # GET /invitations/new
  def new
    @invitation = @agency.invitations.new
  end

  # GET /invitations/1/edit
  def edit
  end

  # POST /invitations
  def create
    Invitation.transaction do
      @invitation = @agency.invitations.new(invitation_params)

      if @invitation.save
        invite_sms(@invitation)
        invite_email(@invitation)
        redirect_to agency_invitations_path, notice: "Survey invitation was successfully created."
      else
        render :new
        raise ActiveRecord::Rollback, "Survey failed to save"
      end
    end
  end

  # PATCH/PUT /invitations/1
  def update
    if @invitation.update(invitation_params)
      redirect_to agency_invitations_path, notice: 'Survey invitation was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /invitations/1
  def destroy
    @invitation.destroy
    redirect_to agency_invitations_path, notice: 'Survey invitation was successfully destroyed.'
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_invitation
    @invitation = @agency.invitations.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def invitation_params
    params.require(:invitation).permit(:name, :email, :phone)
  end

  def invite_sms(si)
    return unless si.phone && twilio.enabled?

    sms_message = "Gotham Public Health: Unfortunately, you have tested positive for COVID-19. Please self-isolate for 7 days or until 3 days after you are completely better.\n\nTo help us stop COVID-19, please take this survey to tell us who you have had contact with: #{code_url(@invitation.token)}"

    twilio.client.messages.create(
      from: twilio.phone_number,
      to: si.phone,
      body: sms_message
    )
  rescue
    flash.alert = "SMS invitation could not be sent"
  end

  def invite_email(si)
    return unless si.email
    InvitationMailer.with(invitation: @invitation).notification_email.deliver_now
  rescue
    flash.alert = "Invitation email could not be sent"
  end

end

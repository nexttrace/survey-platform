class Agency::ContactsController < AgencyController
  before_action :require_agency!
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  # GET /contacts
  def index
    @contacts = @agency.contacts.all
  end

  # GET /contacts/1
  def show
    redirect_to edit_agency_contact_path(@contact)
  end

  # GET /contact/new
  def new
    @contact = @agency.contacts.new
  end

  # GET /contact/1/edit
  def edit
  end

  # POST /contacts
  def create
    raise "oh no"
    Contact.transaction do
      @contact = @agency.contacts.new(contact_params)

      if @contact.save
        invite_sms(@contact)
        invite_email(@contact)
        redirect_to agency_contacts_path, notice: "Survey contact was successfully created."
      else
        render :new
        raise ActiveRecord::Rollback, "Survey failed to save"
      end
    end
  end

  # PATCH/PUT /contacts/1
  def update
    if @contact.update(contact_params)
      redirect_to agency_contacts_path, notice: 'Survey contact was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact.destroy
    redirect_to agency_contacts_path, notice: 'Survey contact was successfully destroyed.'
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_contact
    @contact = @agency.contacts.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def contact_params
    params.require(:contact).permit(:name, :email, :phone)
  end

  def invite_sms(si)
    return unless si.phone && twilio.enabled?

    sms_message = "Gotham Public Health: Unfortunately, you have tested positive for COVID-19. Please self-isolate for 7 days or until 3 days after you are completely better.\n\nTo help us stop COVID-19, please take this survey to tell us who you have had contact with: #{code_url(@contact.token)}"

    twilio.client.messages.create(
      from: twilio.phone_number,
      to: si.phone,
      body: sms_message
    )
  rescue
    flash.alert = "SMS contact could not be sent"
  end

  def invite_email(si)
    return unless si.email
    InvitationMailer.with(contact: @contact).notification_email.deliver_now
  rescue
    flash.alert = "Contact email could not be sent"
  end

end

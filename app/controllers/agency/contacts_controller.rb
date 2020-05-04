class Agency::ContactsController < AgencyController
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
    @contact = Contact.new
  end

  # GET /contact/1/edit
  def edit
  end

  # POST /contacts
  def create
    Contact.transaction do
      @contact = Contact.new(contact_params)

      if @contact.save
        @agency.contacts << @contact
        Invitation.send_test_result!(@agency, @contact)
        redirect_to agency_contacts_path, notice: "Survey invitation successfully sent."
      else
        render :new
        raise ActiveRecord::Rollback, "Survey contact failed to save"
      end
    end
  end

  # PATCH/PUT /contacts/1
  def update
    if params[:resend_invitation]
      Invitation.send_test_result!(@agency, @contact)
      return redirect_to agency_contacts_path, notice: 'Survey invitation sent again.'
    end

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

end

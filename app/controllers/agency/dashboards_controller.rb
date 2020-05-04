class Agency::DashboardsController < AgencyController

  def show
  end

  # Jump straight to survey
  def create
    contact = Contact.create_with(name: current_user.email).
      find_or_create_by!(email: current_user.email)

    Survey.create!(
      agency: current_user.agency,
      contact: contact,
    )

    passwordless.sign_in contact
    redirect_to survey_path
  end

end

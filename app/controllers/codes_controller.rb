class CodesController < RespondentController

  def show
    @survey_invitation = SurveyInvitation.unused.find_by_token!(params[:id])

    SurveyInvitation.transaction do
      @survey_invitation.update!(used_at: Time.now)

      @respondent = Respondent.create!(
        name: @survey_invitation.name,
        email: @survey_invitation.email,
        phone: @survey_invitation.phone,
        survey_invitation: @survey_invitation,
        organization: @survey_invitation.organization,
      )
      sign_in @respondent

      @survey = Survey.create!(
        organization: @survey_invitation.organization,
        respondent: @respondent
      )
    end

    redirect_to survey_path
  end

end

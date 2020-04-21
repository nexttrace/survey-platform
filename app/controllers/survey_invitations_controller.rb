class SurveyInvitationsController < ApplicationController
  before_action :require_organization!
  before_action :set_survey_invitation, only: [:show, :edit, :update, :destroy]

  # GET /survey_invitations
  def index
    @survey_invitations = @organization.survey_invitations.all
  end

  # GET /survey_invitations/1
  def show
    return redirect_to(survey_invitations_path)
  end

  # GET /survey_invitations/new
  def new
    @survey_invitation = @organization.survey_invitations.new
  end

  # GET /survey_invitations/1/edit
  def edit
  end

  # POST /survey_invitations
  def create
    @survey_invitation = @organization.survey_invitations.new(survey_invitation_params)

    if @survey_invitation.save
      redirect_to @survey_invitation, notice: 'Survey invitation was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /survey_invitations/1
  def update
    if @survey_invitation.update(survey_invitation_params)
      redirect_to @survey_invitation, notice: 'Survey invitation was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /survey_invitations/1
  def destroy
    @survey_invitation.destroy
    redirect_to survey_invitations_url, notice: 'Survey invitation was successfully destroyed.'
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_survey_invitation
    @survey_invitation = @organization.survey_invitations.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def survey_invitation_params
    params.require(:survey_invitation).permit(:name, :email, :phone)
  end

end

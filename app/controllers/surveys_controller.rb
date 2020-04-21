class SurveysController < ApplicationController
  def index

  end

  def show
    @survey_invitation = SurveyInvitation.find(params.require(:id))
  end
end

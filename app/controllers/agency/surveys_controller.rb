class Agency::SurveysController < ApplicationController
  before_action :set_agency_survey, only: [:show, :edit, :update, :destroy]

  # GET /agency/surveys
  def index
    @agency_surveys = Agency::Survey.all
  end

  # GET /agency/surveys/1
  def show
  end

  # GET /agency/surveys/new
  def new
    @agency_survey = Agency::Survey.new
  end

  # GET /agency/surveys/1/edit
  def edit
  end

  # POST /agency/surveys
  def create
    @agency_survey = Agency::Survey.new(agency_survey_params)

    if @agency_survey.save
      redirect_to @agency_survey, notice: 'Survey was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /agency/surveys/1
  def update
    if @agency_survey.update(agency_survey_params)
      redirect_to @agency_survey, notice: 'Survey was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /agency/surveys/1
  def destroy
    @agency_survey.destroy
    redirect_to agency_surveys_url, notice: 'Survey was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agency_survey
      @agency_survey = Agency::Survey.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def agency_survey_params
      params.fetch(:agency_survey, {})
    end
end

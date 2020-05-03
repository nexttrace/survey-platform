class SurveysController < ContactsController
  before_action :require_contact!
  before_action :set_survey, only: [:show, :update]

  # # GET /surveys
  # def index
  #   @surveys = Survey.all
  # end

  # GET /surveys/1
  def show
    return redirect_to(survey_step_path('intro')) unless params.has_key?(:step)

    render params[:step]
  end

  # # GET /surveys/new
  # def new
  #   @survey = Survey.new
  # end

  # # GET /surveys/1/edit
  # def edit
  # end

  # # POST /surveys
  # def create
  #   @survey = Survey.new(survey_params)

  #   if @survey.save
  #     redirect_to @survey, notice: 'Survey was successfully created.'
  #   else
  #     render :new
  #   end
  # end

  # PATCH/PUT /surveys/1
  def update
    # for now, assume we just go to step n+1; need to handle last step case
    if @survey.update(survey_params)
      if params.has_key?(:next_step)
        return redirect_to(survey_step_path(params[:next_step].to_i))
      else
        # go to the start of the form? ¯\_(ツ)_/¯
        return redirect_to(survey_step_path(1))
      end
    else
      redirect_to @survey, notice: 'There was a problem saving.' # TODO: this is not right
    end
  end

  # # DELETE /surveys/1
  # def destroy
  #   @survey.destroy
  #   redirect_to survey_url, notice: 'Survey was successfully destroyed.'
  # end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_survey
    @survey = current_contact.survey
  end

  # Only allow a trusted parameter "white list" through.
  def survey_params
    params.require(:survey).permit(data: {})
  end

end

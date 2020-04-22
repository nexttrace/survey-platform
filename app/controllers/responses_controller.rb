class ResponsesController < RespondentController
  before_action :require_respondent!
  # before_action :set_response, only: [:show, :edit, :update, :destroy]

  # # GET /responses
  # def index
  #   @responses = Response.all
  # end

  # GET /responses/1
  def show
    return redirect_to(response_step_path(1)) unless params.has_key?(:step)

    @response = current_respondent.response
    @organization = current_respondent.organization

    current_step_path = response_step_path(@response.current_step)
    return redirect_to(current_step_path) unless 

    render params[:step] if (1..5).include?(params[:step].to_i)
  end

  # # GET /responses/new
  # def new
  #   @response = Response.new
  # end

  # # GET /responses/1/edit
  # def edit
  # end

  # # POST /responses
  # def create
  #   @response = Response.new(response_params)

  #   if @response.save
  #     redirect_to @response, notice: 'Response was successfully created.'
  #   else
  #     render :new
  #   end
  # end

  # # PATCH/PUT /responses/1
  # def update
  #   if @response.update(response_params)
  #     redirect_to @response, notice: 'Response was successfully updated.'
  #   else
  #     render :edit
  #   end
  # end

  # # DELETE /responses/1
  # def destroy
  #   @response.destroy
  #   redirect_to responses_url, notice: 'Response was successfully destroyed.'
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_response
      @response = current_respondent.response
    end

    # Only allow a trusted parameter "white list" through.
    def response_params
      params.require(:response).permit(:data)
    end
end

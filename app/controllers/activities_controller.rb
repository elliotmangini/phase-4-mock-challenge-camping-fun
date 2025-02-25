class ActivitiesController < ApplicationController
  wrap_parameters format: []
  before_action :set_activity, only: [:show, :update, :destroy]

  # GET /activities
  def index
    @activities = Activity.all

    render json: @activities
  end

  # # GET /activities/1
  # def show
  #   render json: @activity
  # end

  # # POST /activities
  # def create
  #   @activity = Activity.new(activity_params)

  #   if @activity.save
  #     render json: @activity, status: :created, location: @activity
  #   else
  #     render json: @activity.errors, status: :unprocessable_entity
  #   end
  # end

  # # PATCH/PUT /activities/1
  # def update
  #   if @activity.update(activity_params)
  #     render json: @activity
  #   else
  #     render json: @activity.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /activities/1
  def destroy
    @activity.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # # Only allow a list of trusted parameters through.
    # def activity_params
    #   params.require(:activity).permit(:name, :difficulty)
    # end
end

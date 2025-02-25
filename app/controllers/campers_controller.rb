class CampersController < ApplicationController
  wrap_parameters format: []
  before_action :set_camper, only: [:show, :update, :destroy]
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  # GET /campers
  def index
    @campers = Camper.all

    render json: @campers
  end

  # GET /campers/1
  def show
    render json: @camper, serializer: CamperActivitesSerializer
  end

  # POST /campers
  def create
    @camper = Camper.create!(camper_params)
    render json: @camper, status: :created, location: @camper
  end

  # # PATCH/PUT /campers/1
  # def update
  #   if @camper.update(camper_params)
  #     render json: @camper
  #   else
  #     render json: @camper.errors, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /campers/1
  # def destroy
  #   @camper.destroy
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_camper
      @camper = Camper.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def camper_params
      params.permit(:name, :age)
    end

    def render_unprocessable_entity_response(invalid)
      render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end

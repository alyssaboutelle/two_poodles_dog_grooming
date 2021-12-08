class ServicesController < ApplicationController
  before_action :set_service, only: %i[show edit update destroy]

  # GET /services
  def index
    @q = Service.ransack(params[:q])
    @services = @q.result(distinct: true).includes(:saved_appointment).page(params[:page]).per(10)
  end

  # GET /services/1
  def show; end

  # GET /services/new
  def new
    @service = Service.new
  end

  # GET /services/1/edit
  def edit; end

  # POST /services
  def create
    @service = Service.new(service_params)

    if @service.save
      message = "Service was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @service, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /services/1
  def update
    if @service.update(service_params)
      redirect_to @service, notice: "Service was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /services/1
  def destroy
    @service.destroy
    message = "Service was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to services_url, notice: message
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_service
    @service = Service.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def service_params
    params.require(:service).permit(:shampoo, :pest_treatment, :condition,
                                    :nail_trim, :pad_shaving, :ear_cleaning, :teeth_brushing, :gland_cleaning, :hair_cut, :hair_trim, :brushing, :saved_appointment_id)
  end
end

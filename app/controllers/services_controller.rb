class ServicesController < ApplicationController
  before_action :set_service, only: %i[show edit update destroy]

  def index
    @q = Service.ransack(params[:q])
    @services = @q.result(distinct: true).includes(:saved_appointment).page(params[:page]).per(10)
  end

  def show; end

  def new
    @service = Service.new
  end

  def edit; end

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

  def update
    if @service.update(service_params)
      redirect_to @service, notice: "Service was successfully updated."
    else
      render :edit
    end
  end

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

  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:shampoo, :pest_treatment, :condition,
                                    :nail_trim, :pad_shaving, :ear_cleaning, :teeth_brushing, :gland_cleaning, :hair_cut, :hair_trim, :brushing, :saved_appointment_id)
  end
end

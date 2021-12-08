class DogProfilesController < ApplicationController
  before_action :set_dog_profile, only: %i[show edit update destroy]

  def index
    @q = DogProfile.ransack(params[:q])
    @dog_profiles = @q.result(distinct: true).includes(:owner,
                                                       :saved_appointments, :authorized_associate).page(params[:page]).per(10)
  end

  def show
    @saved_appointment = SavedAppointment.new
  end

  def new
    @dog_profile = DogProfile.new
  end

  def edit; end

  def create
    @dog_profile = DogProfile.new(dog_profile_params)

    if @dog_profile.save
      message = "DogProfile was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @dog_profile, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @dog_profile.update(dog_profile_params)
      redirect_to @dog_profile, notice: "Dog profile was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @dog_profile.destroy
    message = "DogProfile was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to dog_profiles_url, notice: message
    end
  end

  private

  def set_dog_profile
    @dog_profile = DogProfile.find(params[:id])
  end

  def dog_profile_params
    params.require(:dog_profile).permit(:dog_name, :owner_id, :breed,
                                        :date_of_birth, :allergies, :behavior_notes, :treats)
  end
end

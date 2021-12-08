class DogProfilesController < ApplicationController
  before_action :set_dog_profile, only: [:show, :edit, :update, :destroy]

  # GET /dog_profiles
  def index
    @dog_profiles = DogProfile.all
  end

  # GET /dog_profiles/1
  def show
    @saved_appointment = SavedAppointment.new
  end

  # GET /dog_profiles/new
  def new
    @dog_profile = DogProfile.new
  end

  # GET /dog_profiles/1/edit
  def edit
  end

  # POST /dog_profiles
  def create
    @dog_profile = DogProfile.new(dog_profile_params)

    if @dog_profile.save
      message = 'DogProfile was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @dog_profile, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /dog_profiles/1
  def update
    if @dog_profile.update(dog_profile_params)
      redirect_to @dog_profile, notice: 'Dog profile was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /dog_profiles/1
  def destroy
    @dog_profile.destroy
    message = "DogProfile was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to dog_profiles_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dog_profile
      @dog_profile = DogProfile.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dog_profile_params
      params.require(:dog_profile).permit(:dog_name, :owner_id, :breed, :date_of_birth, :allergies, :behavior_notes, :treats)
    end
end

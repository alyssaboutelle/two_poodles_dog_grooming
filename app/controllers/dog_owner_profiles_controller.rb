class DogOwnerProfilesController < ApplicationController
  before_action :current_user_must_be_dog_owner_profile_user, only: [:edit, :update, :destroy] 

  before_action :set_dog_owner_profile, only: [:show, :edit, :update, :destroy]

  # GET /dog_owner_profiles
  def index
    @dog_owner_profiles = DogOwnerProfile.all
  end

  # GET /dog_owner_profiles/1
  def show
    @authorized_associate = AuthorizedAssociate.new
    @saved_appointment = SavedAppointment.new
    @dog_profile = DogProfile.new
  end

  # GET /dog_owner_profiles/new
  def new
    @dog_owner_profile = DogOwnerProfile.new
  end

  # GET /dog_owner_profiles/1/edit
  def edit
  end

  # POST /dog_owner_profiles
  def create
    @dog_owner_profile = DogOwnerProfile.new(dog_owner_profile_params)

    if @dog_owner_profile.save
      message = 'DogOwnerProfile was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @dog_owner_profile, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /dog_owner_profiles/1
  def update
    if @dog_owner_profile.update(dog_owner_profile_params)
      redirect_to @dog_owner_profile, notice: 'Dog owner profile was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /dog_owner_profiles/1
  def destroy
    @dog_owner_profile.destroy
    message = "DogOwnerProfile was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to dog_owner_profiles_url, notice: message
    end
  end


  private

  def current_user_must_be_dog_owner_profile_user
    set_dog_owner_profile
    unless current_user == @dog_owner_profile.user
      redirect_back fallback_location: root_path, alert: "You are not authorized for that."
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_dog_owner_profile
      @dog_owner_profile = DogOwnerProfile.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dog_owner_profile_params
      params.require(:dog_owner_profile).permit(:first_name, :last_name, :phone, :home_address, :user_id, :email, :authorized_associates_id)
    end
end

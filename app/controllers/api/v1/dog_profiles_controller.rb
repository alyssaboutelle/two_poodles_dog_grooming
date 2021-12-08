class Api::V1::DogProfilesController < Api::V1::GraphitiController
  def index
    dog_profiles = DogProfileResource.all(params)
    respond_with(dog_profiles)
  end

  def show
    dog_profile = DogProfileResource.find(params)
    respond_with(dog_profile)
  end

  def create
    dog_profile = DogProfileResource.build(params)

    if dog_profile.save
      render jsonapi: dog_profile, status: :created
    else
      render jsonapi_errors: dog_profile
    end
  end

  def update
    dog_profile = DogProfileResource.find(params)

    if dog_profile.update_attributes
      render jsonapi: dog_profile
    else
      render jsonapi_errors: dog_profile
    end
  end

  def destroy
    dog_profile = DogProfileResource.find(params)

    if dog_profile.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: dog_profile
    end
  end
end

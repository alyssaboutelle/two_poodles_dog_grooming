class Api::V1::DogOwnerProfilesController < Api::V1::GraphitiController
  def index
    dog_owner_profiles = DogOwnerProfileResource.all(params)
    respond_with(dog_owner_profiles)
  end

  def show
    dog_owner_profile = DogOwnerProfileResource.find(params)
    respond_with(dog_owner_profile)
  end

  def create
    dog_owner_profile = DogOwnerProfileResource.build(params)

    if dog_owner_profile.save
      render jsonapi: dog_owner_profile, status: :created
    else
      render jsonapi_errors: dog_owner_profile
    end
  end

  def update
    dog_owner_profile = DogOwnerProfileResource.find(params)

    if dog_owner_profile.update_attributes
      render jsonapi: dog_owner_profile
    else
      render jsonapi_errors: dog_owner_profile
    end
  end

  def destroy
    dog_owner_profile = DogOwnerProfileResource.find(params)

    if dog_owner_profile.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: dog_owner_profile
    end
  end
end

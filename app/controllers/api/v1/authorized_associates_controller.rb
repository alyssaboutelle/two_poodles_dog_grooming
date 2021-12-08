class Api::V1::AuthorizedAssociatesController < Api::V1::GraphitiController
  def index
    authorized_associates = AuthorizedAssociateResource.all(params)
    respond_with(authorized_associates)
  end

  def show
    authorized_associate = AuthorizedAssociateResource.find(params)
    respond_with(authorized_associate)
  end

  def create
    authorized_associate = AuthorizedAssociateResource.build(params)

    if authorized_associate.save
      render jsonapi: authorized_associate, status: 201
    else
      render jsonapi_errors: authorized_associate
    end
  end

  def update
    authorized_associate = AuthorizedAssociateResource.find(params)

    if authorized_associate.update_attributes
      render jsonapi: authorized_associate
    else
      render jsonapi_errors: authorized_associate
    end
  end

  def destroy
    authorized_associate = AuthorizedAssociateResource.find(params)

    if authorized_associate.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: authorized_associate
    end
  end
end

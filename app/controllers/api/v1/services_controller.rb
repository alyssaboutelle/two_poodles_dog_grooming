class Api::V1::ServicesController < Api::V1::GraphitiController
  def index
    services = ServiceResource.all(params)
    respond_with(services)
  end

  def show
    service = ServiceResource.find(params)
    respond_with(service)
  end

  def create
    service = ServiceResource.build(params)

    if service.save
      render jsonapi: service, status: :created
    else
      render jsonapi_errors: service
    end
  end

  def update
    service = ServiceResource.find(params)

    if service.update_attributes
      render jsonapi: service
    else
      render jsonapi_errors: service
    end
  end

  def destroy
    service = ServiceResource.find(params)

    if service.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: service
    end
  end
end

class Api::V1::SavedAppointmentsController < Api::V1::GraphitiController
  def index
    saved_appointments = SavedAppointmentResource.all(params)
    respond_with(saved_appointments)
  end

  def show
    saved_appointment = SavedAppointmentResource.find(params)
    respond_with(saved_appointment)
  end

  def create
    saved_appointment = SavedAppointmentResource.build(params)

    if saved_appointment.save
      render jsonapi: saved_appointment, status: :created
    else
      render jsonapi_errors: saved_appointment
    end
  end

  def update
    saved_appointment = SavedAppointmentResource.find(params)

    if saved_appointment.update_attributes
      render jsonapi: saved_appointment
    else
      render jsonapi_errors: saved_appointment
    end
  end

  def destroy
    saved_appointment = SavedAppointmentResource.find(params)

    if saved_appointment.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: saved_appointment
    end
  end
end

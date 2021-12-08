class SavedAppointmentsController < ApplicationController
  before_action :set_saved_appointment, only: [:show, :edit, :update, :destroy]

  # GET /saved_appointments
  def index
    @saved_appointments = SavedAppointment.all
  end

  # GET /saved_appointments/1
  def show
  end

  # GET /saved_appointments/new
  def new
    @saved_appointment = SavedAppointment.new
  end

  # GET /saved_appointments/1/edit
  def edit
  end

  # POST /saved_appointments
  def create
    @saved_appointment = SavedAppointment.new(saved_appointment_params)

    if @saved_appointment.save
      redirect_to @saved_appointment, notice: 'Saved appointment was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /saved_appointments/1
  def update
    if @saved_appointment.update(saved_appointment_params)
      redirect_to @saved_appointment, notice: 'Saved appointment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /saved_appointments/1
  def destroy
    @saved_appointment.destroy
    redirect_to saved_appointments_url, notice: 'Saved appointment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_saved_appointment
      @saved_appointment = SavedAppointment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def saved_appointment_params
      params.require(:saved_appointment).permit(:dog_id, :owner_id, :nickname_for_appointment)
    end
end

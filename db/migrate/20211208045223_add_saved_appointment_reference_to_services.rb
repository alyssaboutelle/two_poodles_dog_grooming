class AddSavedAppointmentReferenceToServices < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :services, :saved_appointments
    add_index :services, :saved_appointment_id
  end
end

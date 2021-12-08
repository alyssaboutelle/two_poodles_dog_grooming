class AddServiceCountToSavedAppointments < ActiveRecord::Migration[6.0]
  def change
    add_column :saved_appointments, :services_count, :integer
  end
end

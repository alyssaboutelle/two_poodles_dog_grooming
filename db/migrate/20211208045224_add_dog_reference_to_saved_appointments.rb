class AddDogReferenceToSavedAppointments < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :saved_appointments, :dog_profiles, column: :dog_id
    add_index :saved_appointments, :dog_id
    change_column_null :saved_appointments, :dog_id, false
  end
end

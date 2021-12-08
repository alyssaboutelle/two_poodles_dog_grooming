class AddOwnerReferenceToSavedAppointments < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :saved_appointments, :dog_owner_profiles, column: :owner_id
    add_index :saved_appointments, :owner_id
    change_column_null :saved_appointments, :owner_id, false
  end
end

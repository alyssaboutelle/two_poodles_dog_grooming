class CreateSavedAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :saved_appointments do |t|
      t.integer :dog_id
      t.integer :owner_id
      t.string :nickname_for_appointment

      t.timestamps
    end
  end
end

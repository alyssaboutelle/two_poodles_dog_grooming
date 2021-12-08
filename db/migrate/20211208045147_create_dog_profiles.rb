class CreateDogProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :dog_profiles do |t|
      t.string :dog_name
      t.integer :owner_id
      t.string :breed
      t.string :date_of_birth
      t.string :allergies
      t.string :behavior_notes
      t.string :treats

      t.timestamps
    end
  end
end

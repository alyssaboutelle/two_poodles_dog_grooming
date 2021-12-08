class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :shampoo
      t.string :pest_treatment
      t.string :condition
      t.string :nail_trim
      t.string :pad_shaving
      t.string :ear_cleaning
      t.string :teeth_brushing
      t.string :gland_cleaning
      t.string :hair_cut
      t.string :hair_trim
      t.string :brushing
      t.integer :saved_appointment_id

      t.timestamps
    end
  end
end

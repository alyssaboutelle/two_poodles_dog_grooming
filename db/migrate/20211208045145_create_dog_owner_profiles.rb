class CreateDogOwnerProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :dog_owner_profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :home_address
      t.integer :user_id
      t.string :email
      t.integer :authorized_associates_id

      t.timestamps
    end
  end
end

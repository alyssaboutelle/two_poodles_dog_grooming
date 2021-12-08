class AddUserReferenceToDogOwnerProfiles < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :dog_owner_profiles, :users
    add_index :dog_owner_profiles, :user_id
    change_column_null :dog_owner_profiles, :user_id, false
  end
end

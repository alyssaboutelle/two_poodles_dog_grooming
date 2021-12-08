class AddDogOwnerProfileReferenceToAuthorizedAssociates < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :authorized_associates, :dog_owner_profiles
    add_index :authorized_associates, :dog_owner_profile_id
    change_column_null :authorized_associates, :dog_owner_profile_id, false
  end
end

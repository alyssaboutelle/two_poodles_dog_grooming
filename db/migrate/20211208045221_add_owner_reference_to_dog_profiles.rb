class AddOwnerReferenceToDogProfiles < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :dog_profiles, :dog_owner_profiles, column: :owner_id
    add_index :dog_profiles, :owner_id
    change_column_null :dog_profiles, :owner_id, false
  end
end

class CreateAuthorizedAssociates < ActiveRecord::Migration[6.0]
  def change
    create_table :authorized_associates do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.integer :dog_owner_profile_id

      t.timestamps
    end
  end
end

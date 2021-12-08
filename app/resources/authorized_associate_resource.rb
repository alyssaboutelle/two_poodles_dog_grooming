class AuthorizedAssociateResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :first_name, :string
  attribute :last_name, :string
  attribute :phone, :string
  attribute :dog_owner_profile_id, :integer

  # Direct associations

  # Indirect associations

end

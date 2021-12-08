class DogOwnerProfileResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :first_name, :string
  attribute :last_name, :string
  attribute :phone, :string
  attribute :home_address, :string
  attribute :user_id, :integer
  attribute :email, :string
  attribute :authorized_associates_id, :integer

  # Direct associations

  belongs_to :user

  # Indirect associations

end

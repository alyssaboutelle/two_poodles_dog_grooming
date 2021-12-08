class DogProfileResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :dog_name, :string
  attribute :owner_id, :integer
  attribute :breed, :string
  attribute :date_of_birth, :string
  attribute :allergies, :string
  attribute :behavior_notes, :string
  attribute :treats, :string

  # Direct associations

  # Indirect associations

end

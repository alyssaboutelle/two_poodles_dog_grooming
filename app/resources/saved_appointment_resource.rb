class SavedAppointmentResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :dog_id, :integer
  attribute :owner_id, :integer
  attribute :nickname_for_appointment, :string

  # Direct associations

  has_many   :services

  belongs_to :dog,
             resource: DogProfileResource

  belongs_to :owner,
             resource: DogOwnerProfileResource

  # Indirect associations

end

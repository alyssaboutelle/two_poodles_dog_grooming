class DogOwnerProfile < ApplicationRecord
  # Direct associations

  has_many   :authorized_associates,
             dependent: :destroy

  has_many   :saved_appointments,
             foreign_key: "owner_id",
             dependent: :destroy

  has_many   :dog_profiles,
             foreign_key: "owner_id",
             dependent: :destroy

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    first_name
  end
end

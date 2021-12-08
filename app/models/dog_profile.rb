class DogProfile < ApplicationRecord
  # Direct associations

  belongs_to :owner,
             :class_name => "DogOwnerProfile"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    dog_name
  end

end

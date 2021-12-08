class SavedAppointment < ApplicationRecord
  # Direct associations

  belongs_to :dog,
             :class_name => "DogProfile"

  belongs_to :owner,
             :class_name => "DogOwnerProfile"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    dog.to_s
  end

end

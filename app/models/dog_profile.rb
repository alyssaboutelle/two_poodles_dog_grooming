class DogProfile < ApplicationRecord
  # Direct associations

  has_many   :saved_appointments,
             :foreign_key => "dog_id",
             :dependent => :destroy

  belongs_to :owner,
             :class_name => "DogOwnerProfile"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    dog_name
  end

end

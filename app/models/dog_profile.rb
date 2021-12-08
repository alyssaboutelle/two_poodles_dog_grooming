class DogProfile < ApplicationRecord
  # Direct associations

  has_many   :saved_appointments,
             :foreign_key => "dog_id",
             :dependent => :destroy

  belongs_to :owner,
             :class_name => "DogOwnerProfile"

  # Indirect associations

  has_one    :authorized_associate,
             :through => :owner,
             :source => :authorized_associates

  # Validations

  # Scopes

  def to_s
    dog_name
  end

end

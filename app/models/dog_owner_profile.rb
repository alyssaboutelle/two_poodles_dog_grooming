class DogOwnerProfile < ApplicationRecord
  # Direct associations

  has_many   :dog_profiles,
             :foreign_key => "owner_id",
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    first_name
  end

end

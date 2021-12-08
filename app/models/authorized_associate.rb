class AuthorizedAssociate < ApplicationRecord
  # Direct associations

  belongs_to :dog_owner_profile

  # Indirect associations

  has_one    :dog_profile,
             :through => :dog_owner_profile,
             :source => :dog_profiles

  # Validations

  # Scopes

  def to_s
    first_name
  end

end

class AuthorizedAssociate < ApplicationRecord
  # Direct associations

  belongs_to :dog_owner_profile

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    first_name
  end

end

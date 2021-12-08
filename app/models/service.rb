class Service < ApplicationRecord
  # Direct associations

  belongs_to :saved_appointment,
             optional: true,
             counter_cache: true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    shampoo
  end
end

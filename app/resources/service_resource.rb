class ServiceResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :shampoo, :string
  attribute :pest_treatment, :string
  attribute :condition, :string
  attribute :nail_trim, :string
  attribute :pad_shaving, :string
  attribute :ear_cleaning, :string
  attribute :teeth_brushing, :string
  attribute :gland_cleaning, :string
  attribute :hair_cut, :string
  attribute :hair_trim, :string
  attribute :brushing, :string
  attribute :saved_appointment_id, :integer

  # Direct associations

  belongs_to :saved_appointment

  # Indirect associations
end

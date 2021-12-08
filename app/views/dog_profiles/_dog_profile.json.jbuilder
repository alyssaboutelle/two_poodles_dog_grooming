json.extract! dog_profile, :id, :dog_name, :owner_id, :breed, :date_of_birth, :allergies, :behavior_notes, :treats, :created_at, :updated_at
json.url dog_profile_url(dog_profile, format: :json)

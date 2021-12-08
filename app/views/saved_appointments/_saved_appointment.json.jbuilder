json.extract! saved_appointment, :id, :dog_id, :owner_id,
              :nickname_for_appointment, :created_at, :updated_at
json.url saved_appointment_url(saved_appointment, format: :json)

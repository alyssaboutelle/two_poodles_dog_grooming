json.extract! dog_owner_profile, :id, :first_name, :last_name, :phone,
              :home_address, :user_id, :email, :authorized_associates_id, :created_at, :updated_at
json.url dog_owner_profile_url(dog_owner_profile, format: :json)

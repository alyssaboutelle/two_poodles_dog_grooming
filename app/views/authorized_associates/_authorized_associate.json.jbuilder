json.extract! authorized_associate, :id, :first_name, :last_name, :phone,
              :dog_owner_profile_id, :created_at, :updated_at
json.url authorized_associate_url(authorized_associate, format: :json)

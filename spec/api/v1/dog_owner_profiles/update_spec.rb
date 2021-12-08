require 'rails_helper'

RSpec.describe "dog_owner_profiles#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/dog_owner_profiles/#{dog_owner_profile.id}", payload
  end

  describe 'basic update' do
    let!(:dog_owner_profile) { create(:dog_owner_profile) }

    let(:payload) do
      {
        data: {
          id: dog_owner_profile.id.to_s,
          type: 'dog_owner_profiles',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(DogOwnerProfileResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { dog_owner_profile.reload.attributes }
    end
  end
end

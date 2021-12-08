require 'rails_helper'

RSpec.describe "dog_owner_profiles#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/dog_owner_profiles/#{dog_owner_profile.id}"
  end

  describe 'basic destroy' do
    let!(:dog_owner_profile) { create(:dog_owner_profile) }

    it 'updates the resource' do
      expect(DogOwnerProfileResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { DogOwnerProfile.count }.by(-1)
      expect { dog_owner_profile.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end

require 'rails_helper'

RSpec.describe "dog_owner_profiles#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/dog_owner_profiles/#{dog_owner_profile.id}", params: params
  end

  describe 'basic fetch' do
    let!(:dog_owner_profile) { create(:dog_owner_profile) }

    it 'works' do
      expect(DogOwnerProfileResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('dog_owner_profiles')
      expect(d.id).to eq(dog_owner_profile.id)
    end
  end
end

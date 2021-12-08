require 'rails_helper'

RSpec.describe "dog_profiles#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/dog_profiles/#{dog_profile.id}", params: params
  end

  describe 'basic fetch' do
    let!(:dog_profile) { create(:dog_profile) }

    it 'works' do
      expect(DogProfileResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('dog_profiles')
      expect(d.id).to eq(dog_profile.id)
    end
  end
end

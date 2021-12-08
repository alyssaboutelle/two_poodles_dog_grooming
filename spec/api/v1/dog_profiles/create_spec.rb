require 'rails_helper'

RSpec.describe "dog_profiles#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/dog_profiles", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'dog_profiles',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(DogProfileResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { DogProfile.count }.by(1)
    end
  end
end

require "rails_helper"

RSpec.describe "dog_owner_profiles#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/dog_owner_profiles", payload
  end

  describe "basic create" do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: "dog_owner_profiles",
          attributes: params,
        },
      }
    end

    it "works" do
      expect(DogOwnerProfileResource).to receive(:build).and_call_original
      expect do
        make_request
        expect(response.status).to eq(201), response.body
      end.to change { DogOwnerProfile.count }.by(1)
    end
  end
end

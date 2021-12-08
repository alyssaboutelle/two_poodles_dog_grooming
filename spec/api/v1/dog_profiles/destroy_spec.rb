require "rails_helper"

RSpec.describe "dog_profiles#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/dog_profiles/#{dog_profile.id}"
  end

  describe "basic destroy" do
    let!(:dog_profile) { create(:dog_profile) }

    it "updates the resource" do
      expect(DogProfileResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { DogProfile.count }.by(-1)
      expect { dog_profile.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end

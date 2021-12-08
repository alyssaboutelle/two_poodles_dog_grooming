require "rails_helper"

RSpec.describe "dog_profiles#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/dog_profiles", params: params
  end

  describe "basic fetch" do
    let!(:dog_profile1) { create(:dog_profile) }
    let!(:dog_profile2) { create(:dog_profile) }

    it "works" do
      expect(DogProfileResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["dog_profiles"])
      expect(d.map(&:id)).to match_array([dog_profile1.id, dog_profile2.id])
    end
  end
end

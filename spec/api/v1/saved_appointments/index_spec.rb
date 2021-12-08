require "rails_helper"

RSpec.describe "saved_appointments#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/saved_appointments", params: params
  end

  describe "basic fetch" do
    let!(:saved_appointment1) { create(:saved_appointment) }
    let!(:saved_appointment2) { create(:saved_appointment) }

    it "works" do
      expect(SavedAppointmentResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["saved_appointments"])
      expect(d.map(&:id)).to match_array([saved_appointment1.id,
                                          saved_appointment2.id])
    end
  end
end

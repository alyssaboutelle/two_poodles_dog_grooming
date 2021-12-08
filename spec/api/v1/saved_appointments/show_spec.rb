require "rails_helper"

RSpec.describe "saved_appointments#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/saved_appointments/#{saved_appointment.id}",
                params: params
  end

  describe "basic fetch" do
    let!(:saved_appointment) { create(:saved_appointment) }

    it "works" do
      expect(SavedAppointmentResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("saved_appointments")
      expect(d.id).to eq(saved_appointment.id)
    end
  end
end

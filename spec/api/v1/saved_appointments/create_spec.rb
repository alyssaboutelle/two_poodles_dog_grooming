require 'rails_helper'

RSpec.describe "saved_appointments#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/saved_appointments", payload
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
          type: 'saved_appointments',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(SavedAppointmentResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { SavedAppointment.count }.by(1)
    end
  end
end

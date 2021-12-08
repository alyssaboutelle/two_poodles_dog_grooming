require 'rails_helper'

RSpec.describe "saved_appointments#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/saved_appointments/#{saved_appointment.id}", payload
  end

  describe 'basic update' do
    let!(:saved_appointment) { create(:saved_appointment) }

    let(:payload) do
      {
        data: {
          id: saved_appointment.id.to_s,
          type: 'saved_appointments',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(SavedAppointmentResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { saved_appointment.reload.attributes }
    end
  end
end

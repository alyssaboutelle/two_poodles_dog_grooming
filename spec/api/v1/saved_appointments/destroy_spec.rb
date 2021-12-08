require 'rails_helper'

RSpec.describe "saved_appointments#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/saved_appointments/#{saved_appointment.id}"
  end

  describe 'basic destroy' do
    let!(:saved_appointment) { create(:saved_appointment) }

    it 'updates the resource' do
      expect(SavedAppointmentResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { SavedAppointment.count }.by(-1)
      expect { saved_appointment.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end

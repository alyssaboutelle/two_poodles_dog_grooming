require 'rails_helper'

RSpec.describe SavedAppointmentResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'saved_appointments',
          attributes: { }
        }
      }
    end

    let(:instance) do
      SavedAppointmentResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { SavedAppointment.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:saved_appointment) { create(:saved_appointment) }

    let(:payload) do
      {
        data: {
          id: saved_appointment.id.to_s,
          type: 'saved_appointments',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      SavedAppointmentResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { saved_appointment.reload.updated_at }
      # .and change { saved_appointment.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:saved_appointment) { create(:saved_appointment) }

    let(:instance) do
      SavedAppointmentResource.find(id: saved_appointment.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { SavedAppointment.count }.by(-1)
    end
  end
end

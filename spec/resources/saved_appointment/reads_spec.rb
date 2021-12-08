require 'rails_helper'

RSpec.describe SavedAppointmentResource, type: :resource do
  describe 'serialization' do
    let!(:saved_appointment) { create(:saved_appointment) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(saved_appointment.id)
      expect(data.jsonapi_type).to eq('saved_appointments')
    end
  end

  describe 'filtering' do
    let!(:saved_appointment1) { create(:saved_appointment) }
    let!(:saved_appointment2) { create(:saved_appointment) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: saved_appointment2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([saved_appointment2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:saved_appointment1) { create(:saved_appointment) }
      let!(:saved_appointment2) { create(:saved_appointment) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            saved_appointment1.id,
            saved_appointment2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            saved_appointment2.id,
            saved_appointment1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end

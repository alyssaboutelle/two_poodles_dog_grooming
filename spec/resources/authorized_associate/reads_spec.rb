require 'rails_helper'

RSpec.describe AuthorizedAssociateResource, type: :resource do
  describe 'serialization' do
    let!(:authorized_associate) { create(:authorized_associate) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(authorized_associate.id)
      expect(data.jsonapi_type).to eq('authorized_associates')
    end
  end

  describe 'filtering' do
    let!(:authorized_associate1) { create(:authorized_associate) }
    let!(:authorized_associate2) { create(:authorized_associate) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: authorized_associate2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([authorized_associate2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:authorized_associate1) { create(:authorized_associate) }
      let!(:authorized_associate2) { create(:authorized_associate) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            authorized_associate1.id,
            authorized_associate2.id
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
            authorized_associate2.id,
            authorized_associate1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end

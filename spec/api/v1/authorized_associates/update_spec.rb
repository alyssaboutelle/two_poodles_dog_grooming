require 'rails_helper'

RSpec.describe "authorized_associates#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/authorized_associates/#{authorized_associate.id}", payload
  end

  describe 'basic update' do
    let!(:authorized_associate) { create(:authorized_associate) }

    let(:payload) do
      {
        data: {
          id: authorized_associate.id.to_s,
          type: 'authorized_associates',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(AuthorizedAssociateResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { authorized_associate.reload.attributes }
    end
  end
end

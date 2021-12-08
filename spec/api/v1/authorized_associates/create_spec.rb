require 'rails_helper'

RSpec.describe "authorized_associates#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/authorized_associates", payload
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
          type: 'authorized_associates',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(AuthorizedAssociateResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { AuthorizedAssociate.count }.by(1)
    end
  end
end

require 'rails_helper'

RSpec.describe "authorized_associates#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/authorized_associates/#{authorized_associate.id}", params: params
  end

  describe 'basic fetch' do
    let!(:authorized_associate) { create(:authorized_associate) }

    it 'works' do
      expect(AuthorizedAssociateResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('authorized_associates')
      expect(d.id).to eq(authorized_associate.id)
    end
  end
end

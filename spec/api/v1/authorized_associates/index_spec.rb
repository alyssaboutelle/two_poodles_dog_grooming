require 'rails_helper'

RSpec.describe "authorized_associates#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/authorized_associates", params: params
  end

  describe 'basic fetch' do
    let!(:authorized_associate1) { create(:authorized_associate) }
    let!(:authorized_associate2) { create(:authorized_associate) }

    it 'works' do
      expect(AuthorizedAssociateResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['authorized_associates'])
      expect(d.map(&:id)).to match_array([authorized_associate1.id, authorized_associate2.id])
    end
  end
end

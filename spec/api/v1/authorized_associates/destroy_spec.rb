require 'rails_helper'

RSpec.describe "authorized_associates#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/authorized_associates/#{authorized_associate.id}"
  end

  describe 'basic destroy' do
    let!(:authorized_associate) { create(:authorized_associate) }

    it 'updates the resource' do
      expect(AuthorizedAssociateResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { AuthorizedAssociate.count }.by(-1)
      expect { authorized_associate.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end

require "rails_helper"

RSpec.describe AuthorizedAssociateResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "authorized_associates",
          attributes: {},
        },
      }
    end

    let(:instance) do
      AuthorizedAssociateResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { AuthorizedAssociate.count }.by(1)
    end
  end

  describe "updating" do
    let!(:authorized_associate) { create(:authorized_associate) }

    let(:payload) do
      {
        data: {
          id: authorized_associate.id.to_s,
          type: "authorized_associates",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      AuthorizedAssociateResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { authorized_associate.reload.updated_at }
      # .and change { authorized_associate.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:authorized_associate) { create(:authorized_associate) }

    let(:instance) do
      AuthorizedAssociateResource.find(id: authorized_associate.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { AuthorizedAssociate.count }.by(-1)
    end
  end
end

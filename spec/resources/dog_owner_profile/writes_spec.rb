require "rails_helper"

RSpec.describe DogOwnerProfileResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "dog_owner_profiles",
          attributes: {},
        },
      }
    end

    let(:instance) do
      DogOwnerProfileResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { DogOwnerProfile.count }.by(1)
    end
  end

  describe "updating" do
    let!(:dog_owner_profile) { create(:dog_owner_profile) }

    let(:payload) do
      {
        data: {
          id: dog_owner_profile.id.to_s,
          type: "dog_owner_profiles",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      DogOwnerProfileResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { dog_owner_profile.reload.updated_at }
      # .and change { dog_owner_profile.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:dog_owner_profile) { create(:dog_owner_profile) }

    let(:instance) do
      DogOwnerProfileResource.find(id: dog_owner_profile.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { DogOwnerProfile.count }.by(-1)
    end
  end
end

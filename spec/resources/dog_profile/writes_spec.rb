require 'rails_helper'

RSpec.describe DogProfileResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'dog_profiles',
          attributes: { }
        }
      }
    end

    let(:instance) do
      DogProfileResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { DogProfile.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:dog_profile) { create(:dog_profile) }

    let(:payload) do
      {
        data: {
          id: dog_profile.id.to_s,
          type: 'dog_profiles',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      DogProfileResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { dog_profile.reload.updated_at }
      # .and change { dog_profile.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:dog_profile) { create(:dog_profile) }

    let(:instance) do
      DogProfileResource.find(id: dog_profile.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { DogProfile.count }.by(-1)
    end
  end
end

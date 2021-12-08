require "rails_helper"

RSpec.describe DogProfileResource, type: :resource do
  describe "serialization" do
    let!(:dog_profile) { create(:dog_profile) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(dog_profile.id)
      expect(data.jsonapi_type).to eq("dog_profiles")
    end
  end

  describe "filtering" do
    let!(:dog_profile1) { create(:dog_profile) }
    let!(:dog_profile2) { create(:dog_profile) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: dog_profile2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([dog_profile2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:dog_profile1) { create(:dog_profile) }
      let!(:dog_profile2) { create(:dog_profile) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      dog_profile1.id,
                                      dog_profile2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      dog_profile2.id,
                                      dog_profile1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end

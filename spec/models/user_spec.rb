require "rails_helper"

RSpec.describe User, type: :model do
  describe "Direct Associations" do
    it { should have_many(:dog_owner_profiles) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end

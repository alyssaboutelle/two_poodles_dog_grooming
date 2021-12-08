require "rails_helper"

RSpec.describe SavedAppointment, type: :model do
  describe "Direct Associations" do
    it { should have_many(:services) }

    it { should belong_to(:dog) }

    it { should belong_to(:owner) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end

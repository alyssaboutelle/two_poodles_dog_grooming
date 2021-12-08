require "rails_helper"

RSpec.describe Service, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:saved_appointment) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end

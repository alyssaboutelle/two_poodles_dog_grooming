require 'rails_helper'

RSpec.describe DogProfile, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:saved_appointments) }

    it { should belong_to(:owner) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end

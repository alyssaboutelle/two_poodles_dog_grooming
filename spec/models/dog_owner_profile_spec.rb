require 'rails_helper'

RSpec.describe DogOwnerProfile, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:authorized_associates) }

    it { should have_many(:saved_appointments) }

    it { should have_many(:dog_profiles) }

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end

require 'rails_helper'

RSpec.describe AuthorizedAssociate, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:dog_owner_profile) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end

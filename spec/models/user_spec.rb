require 'rails_helper'

RSpec.describe User, type: :model do

  describe "model validations" do
    it "requires that a name be present" do
      user = User.create(email: "an email")

      expect(user).to_not be_valid
      expect(user.errors.keys).to include(:name)
    end

    it "requires an email" do
      user = User.create(name: "A name")

      expect(user).to_not be_valid
      expect(user.errors.keys).to include(:email)
    end
  end

  describe "model associations" do
    let(:user)   { build(:user) }
    let(:pet)    { build(:pet)}

    it "has one to many pets" do
      user.pets << pet
      expect(user.pets.length).to eq 1
      expect(user.pets.first.name).to eq "Mulder"
    end
  end

  describe ".initialize_from_omniauth" do
    context "developer auth" do
      let(:user) { User.find_or_create_user(OmniAuth.config.mock_auth[:developer]) }

      it "creates a valid user" do
        expect(user).to be_valid
      end

    end
  end
end

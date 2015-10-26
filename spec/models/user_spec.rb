require 'rails_helper'

RSpec.describe User, type: :model do

  describe "model validations" do
    it "requires that a name be present" do
      user = User.create(uid: "123345")

      expect(user).to_not be_valid
      expect(user.errors.keys).to include(:name)
    end
  end

  describe "model associations" do
    let(:user)   { build(:user) }
    let(:pet)    { build(:pet)}

    it "user belongs to a pet/feeder" do
      pet.users << user
      expect(pet.users.length).to eq 1
      expect(pet.users.first.name).to eq "Scully"
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

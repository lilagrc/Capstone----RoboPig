require 'rails_helper'

RSpec.describe User, type: :model do
  describe "model associations" do
    it "has one to many pets" do
      cat = Pet.create(name: "Mulder", breed: "Siamese")
      user = User.create(name: "Scully", email: "scully@xfiles.com")
      user.pets << cat

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

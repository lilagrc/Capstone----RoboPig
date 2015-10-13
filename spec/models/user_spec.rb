require 'rails_helper'

RSpec.describe User, type: :model do
  describe "model associations" do
    it "has one to many pets" do
      cat = Pet.create(name: "Mulder", breed: "Siamese")
      user = User.create(name: "Scully", email: "scully@xfiles.com")
      user.pets << cat

      expect(user.pets.first.name).to eq "Mulder"
    end
  end

  describe "model methods" do

  end
end

require 'rails_helper'

RSpec.describe Pet, type: :model do
  describe "model associations" do
    let(:user)      { build(:user) }
    let(:pet)       { build(:pet)}
    let (:feeding)  { build(:feeding)}

    it "has one to many feedings" do
      pet.feedings << feeding
      expect(pet.feedings.length).to eq 1
      expect(pet.feedings.first.amount).to eq 2
    end

    it "belongs to a user" do
      user.pets << pet

      expect(pet.user.id).to eq 1
    end
  end
end

require 'rails_helper'

RSpec.describe Feeding, type: :model do
  describe "model associations" do
    let(:pet)       { build(:pet)}
    let (:feeding)  { build(:feeding)}

    it "belongs to a pet" do
      pet.feedings << feeding

      expect(feeding.pet.id).to eq 1
    end
  end
end

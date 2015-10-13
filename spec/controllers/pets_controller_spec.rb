require 'rails_helper'

RSpec.describe PetsController, type: :controller do
  describe "#new" do
    it "saves a new blank instance of pet in a variable" do
      get :new

      expect(Pet.all.length).to eq 1
    end

    it "renders the 'new' template" do
      get :new

      expect(response).to render_template("new")
    end
  end

  describe "#create" do
    context "valid params" do
      let (:params) do {pet: {id: 1, name: "cat pig", breed: "cat"}}
      end

      it "creates a new Pet" do
        post :create, params

        expect(Pet.all.length).to eq 1
        expect(Pet.first.name).to eq "cat pig"
      end
    end
  end
end

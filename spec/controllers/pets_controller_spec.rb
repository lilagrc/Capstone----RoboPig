require 'rails_helper'

RSpec.describe PetsController, type: :controller do
  let (:log_in) {
    logged_user = create :user
    session[:user_id] = logged_user.id
  }

  describe "#new" do
    it "renders the 'new' template" do
      log_in
      get :new, :user_id => 1

      expect(response).to render_template("new")
    end
  end

  describe "#create" do
    context "valid params" do
      it "creates a new Pet" do
        user = create :user
        session[:user_id] = user.id
        post :create, :user_id => 1,  :pet => {name: "cat pig", breed: "cat"}

        expect(Pet.all.length).to eq 1
        expect(Pet.first.name).to eq "cat pig"
      end
    end
  end
end

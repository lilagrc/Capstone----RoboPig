require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe "index" do
    let (:log_in) {
    logged_user = create :user
    session[:user_id] = logged_user.id
    create :pet
  }
    it "checks if session exists and assigns @user instance variable" do
      log_in
      get :index

      expect(assigns(:user)).to_not be_nil
    end

    it "will not assign @user if a user is not logged in" do
      get :index

      expect(assigns(:user)).to eq nil
    end
  end
end

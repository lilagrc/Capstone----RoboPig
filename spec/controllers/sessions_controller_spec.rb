require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe "#create" do
    context "when using omniauth developer authorization" do
      context "when successful" do
        before { request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:developer] }

        it "redirects to home page" do
          get :create, provider: :developer

          expect(response).to redirect_to root_path
        end

        it "creates a user" do
          expect { get :create, provider: :developer}.to change(User, :count).by(1)
        end

        it "assigns the session[:user_id]" do
          get :create, provider: :developer

          expect(session[:user_id]).to eq assigns(:user).id
        end
      end

      context "fails to authenticate developer" do
        before { request.env["omniauth.auth"] = :invalid_credential }

        it "redirect to home with flash error" do
          get :create, provider: :developer

          expect(response).to redirect_to root_path
          expect(flash[:error]).to include "Failed to authenticate"
        end
      end
    end
  end

  describe "#destroy" do
    it "destroys the current session" do
      user = create :user
      session[:user_id] = user.id

      get :destroy

      expect(session[:user_id]).to eq nil
    end
  end
end

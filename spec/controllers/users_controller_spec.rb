require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "#index" do
    let(:log_in) {
    @logged_user = create :user
    session[:user_id] = @logged_user.id }

    before :each do
      log_in
      get :show, :id => 1
    end

    it "renders the show page" do
      expect(subject).to render_template :show
      expect(response).to have_http_status(200)
    end

    it "sets @user to the current user" do
      expect(session[:user_id]).to eq @logged_user.id
    end
  end
end

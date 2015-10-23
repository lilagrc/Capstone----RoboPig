require 'rails_helper'

RSpec.describe PiController, type: :controller do
  let(:log_in) {
      @logged_user = create :user
      session[:user_id] = @logged_user.id }


  describe "feed_request" do
    before :each do
      log_in
      create :pet
      put :feed_request
    end

    it "finds or creates a Request record" do
      expect(Request.all.length).to eq 1
    end

    it "sets request body to 'feed'" do
      request = Request.first
      expect(request.body).to eq("feed")
    end
  end

  describe "new_schedule" do
    it "finds or creates a Request record" do
      log_in
      get :new_schedule

      expect(Request.all.length).to eq 1
    end
  end

  describe "set_time" do

    it "finds the request associated with the logged in user" do
      log_in

      request = Request.create(id: 1, user_id: 1)
      patch :set_time

      expect(assigns(:request.user_id)).to eq 1
    end
  end
end



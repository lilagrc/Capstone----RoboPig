require 'rails_helper'

RSpec.describe PiController, type: :controller do
  let(:log_in) {
      @logged_user = create :user
      session[:user_id] = @logged_user.id }

  describe "feed_request" do
    it "finds or creates a Request record" do
      log_in
      create :pet
      put :feed_request

      expect(Request.all.length).to eq 1
    end
  end
end

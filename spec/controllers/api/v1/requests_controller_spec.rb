require 'rails_helper'

RSpec.describe Api::V1::RequestsController, type: :controller do
  describe "run_pi" do
    it "returns json" do
      create :user
      food_request = Request.create(id: 1, body: "feed", schedule: nil, user_id: 1)

      # get :run_pi

      expect(response.header['Content-Type']).to include 'application/json'
    end
  end
end

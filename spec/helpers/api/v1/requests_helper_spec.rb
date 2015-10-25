require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the Api::V1::RequestsHelper. For example:
#
# describe Api::V1::RequestsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe Api::V1::RequestsHelper, type: :helper do
  describe "run_pi" do
    it "returns json" do
      create :user
      food_request = Request.create(id: 1, body: "feed", schedule: nil, user_id: 1)

      # get :run_pi

      expect(response.header['Content-Type']).to include 'application/json'
    end
  end
end

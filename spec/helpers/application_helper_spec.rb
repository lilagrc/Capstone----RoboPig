require 'rails_helper'


RSpec.describe ApplicationHelper, type: :helper do
  describe "helper methods" do
    describe "#logged_in?" do
      it "returns a boolean" do
        user = create :user
        session[:user_id] = user.id

        expect(self.logged_in?).to eq true
      end
    end
  end
end

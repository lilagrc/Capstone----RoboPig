class Api::V1::RequestsController < Api::ApiController

  before_action :authenticate

  # method to send pi information from request db
  def run_pi
    key = request.headers["Authorization"]
    user = User.find_by(api_key: key)
    user_request = Request.find_by(user_id: user.id)
    feed_request = user_request.body
    schedule_request = user_request.schedule

    res = { feed_request: feed_request, schedule_request: schedule_request }
    render json: res
  end

  def confirmation
    key = request.headers["Authorization"]
    user = User.find_by(api_key: key)
    @request = Request.find_by(user_id: user.id)

    if params["request"] == "success"
      @request.body = nil
      @request.schedule = nil
      @request.save
    end

    render :nothing => true
  end
end

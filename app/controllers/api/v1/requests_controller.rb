class Api::V1::RequestsController < Api::ApiController

  before_action :authenticate

  # method to send pi information from request db
  def run_pi
    # id = session[:user_id]
    # HOW TO USE session id? So that the request info that is returned matches the user??
    user_request = Request.find_by(user_id: 1)
    feed_request = user_request.body
    schedule_request = user_request.schedule

    res = { feed_request: feed_request, schedule_request: schedule_request }
    render json: res
  end

  def confirmation
    @request = Request.find_by(user_id: 1)

    if params["request"] == "success"
      @request.body = nil
      @request.schedule = nil
      @request.save
    end

    render :nothing => true
  end
end

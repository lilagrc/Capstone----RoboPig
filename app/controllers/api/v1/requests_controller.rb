class Api::V1::RequestsController < Api::ApiController

  before_action :authenticate

  # method to send pi information from request db
  def run_pi
    feed_request = Request.first.body
    schedule_request = Request.first.schedule

    res = { feed_request: feed_request, schedule_request: schedule_request }
    render json: res
  end

  def confirmation
    @request = Request.find(1)

    if params["request"] == "success"
      flash.now[:notice] = "Your pet has been fed!"
      @request.body = nil
      @request.schedule = nil
      @request.save
    end

    render :nothing => true
  end
end

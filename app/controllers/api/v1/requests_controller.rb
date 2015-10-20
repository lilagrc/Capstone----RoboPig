class Api::V1::RequestsController < Api::ApiController

  before_action :authenticate

  # method to send pi information from request db
  def run_pi
    request = Request.first.body

    res = { request: request}
    render json: res
  end

  def confirmation
    @request = Request.find(1)

    if params["request"] == "success"
      flash.now[:notice] = "Your pet has been fed!"
      @request.body = "none"
      @request.save
    end
    # request = Request.find(1)

    # Request.update()
    #remove body data from db if response is success
    #success message comes in as post request from Pi
    render :nothing => true
  end
end

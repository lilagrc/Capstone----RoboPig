class Api::V1::RequestsController < Api::ApiController

  before_action :authenticate

  # method to send pi information from request db
  def run_pi
    key = request.headers["Authorization"]
    key.slice!("Token token=")
    key.slice!("\"")
    key.slice!("\"")
    user = User.find_by(api_key: key)
    user_request = Request.find_by(user_id: user.id)
    feed_request = user_request.body
    schedule_request = user_request.schedule

    res = { feed_request: feed_request, schedule_request: schedule_request }
    render json: res
  end

  def confirmation
    key = request.headers["Authorization"]
    key.slice!("Token token=")
    key.slice!("\"")
    key.slice!("\"")
    user = User.find_by(api_key: key)
    @request = Request.find_by(user_id: user.id)

    if params["request"] == "success"
      @request.body = nil
      @request.schedule = nil
      @request.save

      add_feeding(user)
    end

    render :nothing => true
  end

  private

  def add_feeding(user)
    #only handles one pet per user for now
    pet_id = user.pets.first.id
    new_feeding = Feeding.new
    new_feeding.pet_id = pet_id
    # new_feeding.date = Time.now.strftime(%I:%M,%m/%d/%y)
    new_feeding.amount = 1
    new_feeding.save
  end

end

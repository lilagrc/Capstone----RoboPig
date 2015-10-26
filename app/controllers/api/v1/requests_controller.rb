class Api::V1::RequestsController < Api::ApiController
  include ActiveRecord::Callbacks

  before_action :authenticate
  after_update :refresh

  # method to send pi information from request db
  def run_pi
    key = request.headers["Authorization"]
    key.slice!("Token token=")
    key.slice!("\"")
    key.slice!("\"")
    pet = Pet.find_by(api_key: key)
    user_request = Request.find_by(pet_id: pet.id)
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
    pet = Pet.find_by(api_key: key)
    @request = Request.find_by(pet_id: pet.id)

    if params["request"] == "success"
      @request.update(body: nil, schedule: nil)
      add_feeding(pet)
      flash[:notice] = "Your pet has been fed."
      redirect_to root_path
    end

    render :nothing => true
  end

  def refresh
    flash[:notice] = "Your pet has been fed."
    render "home/index"
  end

  private


  def add_feeding(pet)
    #only handles one pet per user for now
    new_feeding = Feeding.new
    new_feeding.pet_id = pet.id
    # new_feeding.date = Time.now.strftime(%I:%M,%m/%d/%y)
    new_feeding.amount = 1
    new_feeding.save
  end

end

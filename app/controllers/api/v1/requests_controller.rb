class Api::V1::RequestsController < Api::ApiController

  before_action :authenticate

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
    @pet = Pet.find_by(api_key: key)
    @request = Request.find_by(pet_id: @pet.id)

    if params["request"] == "success"
      @request.update(body: nil, schedule: nil)

      add_feeding(@pet)

      update_current_supply(@pet)
    end

    render :nothing => true
    #
  end


  private

  def add_feeding(pet)
    #only handles one pet per user for now
    new_feeding = Feeding.new
    new_feeding.pet_id = pet.id
    new_feeding.date = Time.now
    new_feeding.save
  end

  def update_current_supply(pet)
    inventory = Inventory.find_by(pet_id: pet.id)
    current_supply = inventory.current_supply - inventory.feeding_amount
    inventory.current_supply = current_supply
    inventory.save
  end

end

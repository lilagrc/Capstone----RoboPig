class ScheduleController < ApplicationController

  #TO DO -- tie schedule to pet
  def index
    scheduled_feedings = Schedule.all
    @scheduled_feedings = scheduled_feedings.order(:time)
  end
end

class ScheduleController < ApplicationController

  def index
    scheduled_feedings = Schedule.all
    @scheduled_feedings = scheduled_feedings.order(:time)
  end
end

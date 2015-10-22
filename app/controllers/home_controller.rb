class HomeController < ApplicationController

  def index
    find_num_feedings
  end

  private

  def find_num_feedings
    feedings = Feeding.where("created_at >= ?", Time.zone.now.beginning_of_day)

    @num_feedings = feedings.size

    return @num_feedings
  end
end

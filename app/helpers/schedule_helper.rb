module ScheduleHelper

  def format_time(time)
    time = time.to_i

    if time == 0
      time = "12am"
    elsif time > 12
      time = "#{time - 12}" + "pm"
    else
      time = "#{time}" + "am"
    end

    return time
  end
end

module ApplicationHelper
  def check_scheduling(room, date_param, hour)
    date = date_param.to_date
    scheduling_date = DateTime.new(date.year, date.month, date.day, hour.to_i)
    Scheduling.find_by(room_id: room.id, time: scheduling_date)
  end

  def scheduling_description(scheduling)
    scheduling ? "Reservado para #{scheduling.user.name}" : "Disponível"
  end

  def can_schedule?(scheduling)
    return true unless scheduling
    return true if scheduling.user == @current_user
    false
  end

  def days_of_week(date_param = nil)
    date = date_param || Date.today
    days = []
    start = date.to_date.beginning_of_week
    0.upto(6) { |n| days << (start + n.day).strftime("%d/%m/%Y") }

    days
  end
end

module ApplicationHelper
  def check_situation(room, date_param, hour)
    date = date_param.to_date
    scheduling_date = DateTime.new(date.year, date.month, date.day, hour.to_i)
    scheduling      = Scheduling.find_by(room_id: room.id, time: scheduling_date)
    scheduling      ? "Reservado para #{scheduling.user.name}" : "Disponível"
  end

  def days_of_week
    days = []
    start = Date.today.beginning_of_week
    0.upto(6) { |n| days << (start + n.day).strftime("%d/%m/%Y") }

    days
  end
end

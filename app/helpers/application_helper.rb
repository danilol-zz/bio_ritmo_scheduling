module ApplicationHelper
  def check_situation(date, hour)
    scheduling_date = DateTime.new(date.year, date.month, date.day, hour)
    scheduling      = Scheduling.find_by(time: scheduling_date)
    scheduling ? "Reservado para outro" : "Disponível"
  end

  def days_of_week(day = Date.today)
    days = []
    start = day.to_date.beginning_of_week
    0.upto(6) { |n| days << (start + n.day).to_s }

    days
  end
end

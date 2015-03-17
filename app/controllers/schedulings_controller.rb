class SchedulingsController < ApplicationController
  before_action :set_scheduling, only: [:update, :destroy]

  def schedule_room
    @scheduling = Scheduling.handle_scheduling(params[:room_id], get_date_time(params[:date].to_date, params[:time]), current_user)
  end

  private
  def set_scheduling
    @scheduling = Scheduling.find(params[:id])
  end

  def scheduling_params
    params.require(:scheduling).permit(:room_id, :user_id, :time)
  end

  def get_date_time(date, time)
    DateTime.new(date.year, date.month, date.day, time.to_i)
  end
end

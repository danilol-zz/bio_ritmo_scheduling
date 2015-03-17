class SchedulingsController < ApplicationController
  before_action :set_scheduling, only: [:update, :destroy]

  def create
    @scheduling = Scheduling.new(scheduling_params)

    respond_to do |format|
      if @scheduling.save
        format.html { redirect_to @scheduling, notice: 'Scheduling was successfully created.' }
        format.json { render :show, status: :created, location: @scheduling }
      else
        format.html { render :new }
        format.json { render json: @scheduling.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @scheduling.update(scheduling_params)
        format.html { redirect_to @scheduling, notice: 'Scheduling was successfully updated.' }
        format.json { render :show, status: :ok, location: @scheduling }
      else
        format.html { render :edit }
        format.json { render json: @scheduling.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @scheduling.destroy
    respond_to do |format|
      format.html { redirect_to schedulings_url, notice: 'Scheduling was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def schedule_room
    date = params[:date].to_date
    scheduling_date = DateTime.new(date.year, date.month, date.day, params[:time].to_i)
    @scheduling = Scheduling.find_by(room_id: params[:room_id], time: scheduling_date)

    if @scheduling.try(:user_id) == current_user.id
      @scheduling.destroy
    elsif @scheduling.blank?
      @scheduling = current_user.schedulings.create(room_id: params[:room_id], time: scheduling_date)
    end
  end

  private
  def set_scheduling
    @scheduling = Scheduling.find(params[:id])
  end

  def scheduling_params
    params.require(:scheduling).permit(:room_id, :user_id, :time)
  end
end

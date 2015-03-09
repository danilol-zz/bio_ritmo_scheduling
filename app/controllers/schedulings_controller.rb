class SchedulingsController < ApplicationController
  before_action :set_scheduling, only: [:show, :edit, :update, :destroy]

  def index
    @hours = [ "06:00", "07:00", "08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00",
               "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:00", "22:00", "23:00"]
  end

  def show
  end

  def new
    @scheduling = Scheduling.new
  end

  def edit
  end

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

  private
  def set_scheduling
    @scheduling = Scheduling.find(params[:id])
  end

  def scheduling_params
    params.require(:scheduling).permit(:room_id, :user_id, :time)
  end
end

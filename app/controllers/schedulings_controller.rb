class SchedulingsController < ApplicationController
  before_action :set_scheduling, only: [:update, :destroy]

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

class Scheduling < ActiveRecord::Base
  validates_presence_of :room_id
  validates_presence_of :time

  belongs_to :user

  def self.handle_scheduling(room_id, date, current_user)
    scheduling = Scheduling.find_by(room_id: room_id, time: date)

    if scheduling.try(:user_id) == current_user.id
      scheduling.destroy
    elsif scheduling.blank?
      scheduling = current_user.schedulings.create(room_id: room_id, time: date)
    end
  end
end

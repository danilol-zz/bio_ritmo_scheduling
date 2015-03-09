class Scheduling < ActiveRecord::Base
  validates_presence_of :room_id
  validates_presence_of :time
end

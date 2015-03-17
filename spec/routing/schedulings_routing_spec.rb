require "rails_helper"

RSpec.describe SchedulingsController, :type => :routing do
  describe "routing" do
    it "routes to #schedule_room" do
      expect(:get => "/schedule_room").to route_to("schedulings#schedule_room")
    end
  end
end

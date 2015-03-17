require 'rails_helper'
RSpec.describe SchedulingsController, :type => :controller do
  before { session[:user_id] = current_user_id }

  let(:user_attributes) { FactoryGirl.attributes_for(:user) }
  let(:current_user_id) { User.create(user_attributes).id }

  let(:valid_session) { {} }

  describe "GET schedule_room" do
    describe "with valid params" do
      describe "without existing scheduling" do
        before { FactoryGirl.create(:room, id: 1) }

        xit "schedules the room" do
          expect {
            get :schedule_room, { room_id: 1, date: DateTime.now }, valid_session
          }.to change(Scheduling, :count).by(1)
        end

        describe "with existing scheduling" do
          xit "destroy the existing Scheduling" do
            expect {
              get :schedule_room, { room_id: 1, date: DateTime.now }, valid_session
            }.to change(Scheduling, :count).by(-1)
          end
        end
      end
    end
  end
end

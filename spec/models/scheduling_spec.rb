require 'rails_helper'

RSpec.describe Scheduling, :type => :model do
  describe 'attribute validations' do
    subject { FactoryGirl.build(:scheduling)  }

    it { expect(subject).to validate_presence_of(:room_id) }
    it { expect(subject).to validate_presence_of(:time) }
  end

  describe "handle_scheduling" do
    subject { Scheduling.handle_scheduling(room_id, time, user) }

    context "when scheduling doesnt exist" do
      let(:user)    { FactoryGirl.create(:user) }
      let(:time)    { Date.today }
      let(:room_id) { 1 }

      it "should be created" do
        expect{ subject }.to change(Scheduling, :count).by(1)
        expect(subject).to be_a(Scheduling)
      end
    end

    context "when scheduling exists" do
      context "and it is from its owner" do
        before { FactoryGirl.create(:scheduling, room_id: room_id, user_id: user.id, time: time) }

        let(:user)    { FactoryGirl.create(:user) }
        let(:time)    { Date.today }
        let(:room_id) { 1 }

        it "should be unscheduled" do
          expect{ subject }.to change(Scheduling, :count).by(-1)
        end
      end
    end
  end
end

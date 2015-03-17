require 'rails_helper'

RSpec.describe ApplicationHelper, :type => :helper do
  describe '#days_of_week' do
    context 'when date param is sunday' do
      it "returns all days of week" do
        expect(days_of_week("Sun, 08 Mar 2015")).to eq ["02/03/2015", "03/03/2015", "04/03/2015", "05/03/2015", "06/03/2015", "07/03/2015", "08/03/2015"]
      end
    end

    context 'when date param is wednesday' do
      it "returns all days of week" do
        expect(days_of_week("Wed, 11 Mar 2015")).to eq ["09/03/2015", "10/03/2015", "11/03/2015", "12/03/2015", "13/03/2015", "14/03/2015", "15/03/2015"]
      end
    end
  end

  describe 'scheduling_description' do
    subject { scheduling_description(scheduling) }

    context 'with scheduling' do
      let(:scheduling) { FactoryGirl.create(:scheduling, room_id: 1, user_id: user.id, time: Date.today)  }
      let(:user)       { FactoryGirl.create(:user, name: "Yoda") }

      it "returns the proper message" do
        expect(subject).to eq "Reservado para Yoda"
      end
    end

    context 'without scheduling' do
      let(:scheduling) { nil }
      it "returns the proper message" do
        expect(subject).to eq "Disponível"
      end
    end
  end

  describe 'can_schedule?' do
    subject { can_schedule?(scheduling) }

    context 'without scheduling' do
      let(:scheduling) { nil }

      it "returns the proper message" do
        expect(subject).to be_truthy
      end
    end

    context 'with scheduling' do
      before { @current_user = current_user }

      context 'with scheduling user is current_user' do
        let(:scheduling)   { FactoryGirl.create(:scheduling, room_id: 1, user_id: current_user.id, time: Date.today)  }
        let(:current_user) { FactoryGirl.create(:user, name: "Yoda") }

        it "returns the proper message" do
          expect(subject).to be_truthy
        end
      end

      context 'with scheduling user is different user' do
        let(:scheduling)   { FactoryGirl.create(:scheduling, room_id: 1, user_id: user.id, time: Date.today)  }
        let(:current_user) { FactoryGirl.create(:user, name: "Yoda",      email: "yoda@force.com", id: 1) }
        let(:user)         { FactoryGirl.create(:user, name: "Palpatine", email: "palp@force.com", id: 2) }

        it "returns the proper message" do
          expect(subject).to be_falsy
        end
      end
    end
  end
end

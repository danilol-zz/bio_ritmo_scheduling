require 'rails_helper'

RSpec.describe Scheduling, :type => :model do
  describe 'attribute validations' do
    subject { FactoryGirl.build(:scheduling)  }

    it { expect(subject).to validate_presence_of(:room_id) }
    it { expect(subject).to validate_presence_of(:time) }
  end
end

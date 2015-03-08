require 'rails_helper'

RSpec.describe Room, :type => :model do
  describe 'attribute validations' do
    subject { FactoryGirl.build(:room)  }

    it { expect(subject).to validate_presence_of(:description) }
  end
end

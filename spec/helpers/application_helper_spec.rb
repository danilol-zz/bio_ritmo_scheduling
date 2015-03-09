require 'rails_helper'

RSpec.describe ApplicationHelper, :type => :helper do
  describe '#days_of_week' do
    context 'when date param is sunday' do
      it "returns all days of week" do
        expect(days_of_week("Sun, 08 Mar 2015")).to eq ["2015-03-02", "2015-03-03", "2015-03-04", "2015-03-05", "2015-03-06", "2015-03-07", "2015-03-08"]
      end
    end

    context 'when date param is wednesday' do
      it "returns all days of week" do
        expect(days_of_week("Wed, 11 Mar 2015")).to eq ["2015-03-09", "2015-03-10", "2015-03-11", "2015-03-12", "2015-03-13", "2015-03-14", "2015-03-15"]
      end
    end
  end
end

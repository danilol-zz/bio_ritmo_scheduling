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
end

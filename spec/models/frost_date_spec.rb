# == Schema Information
#
# Table name: frost_dates
#
#  id                  :integer          not null, primary key
#  prob_fifty_percent  :text
#  prob_ten_percent    :text
#  prob_ninety_percent :text
#  user_id             :integer
#  created_at          :datetime
#  updated_at          :datetime
#

require 'spec_helper'


describe FrostDate do
  it { should belong_to(:user) }
  describe FrostDate do
  it "should return a string" do
    raw_response = HTTParty.get("http://farmsense-prod.apigee.net/v1/frostdates/stations/?lat=428&lon=-112")
      response = JSON.parse(raw_response)
      station_id = response[0]["id"]
      expect(station_id).should == "506586"
    end
  end
end

 # station_id = FrostDate.get_raw_probabilities(response)

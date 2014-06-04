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

class FrostDate < ActiveRecord::Base
  belongs_to :user

# self.get_stations takes the lat/long and returns a multidimensional array of hashes of the closest weather stations to the user
# it outputs the station_id of the closest station (always the first station returned).
  def self.get_station(latitude, longitude)
    raw_response = HTTParty.get("http://farmsense-prod.apigee.net/v1/frostdates/stations/?lat=#{latitude}8&lon=#{longitude}")
    response = JSON.parse(raw_response)
    station_id = response[0]["id"]
  end

# self.get_raw_probabilities finds the chances for frost for the given station.
# it returns an array of hashes that contain the full range of probabilitis for 10% chance of frost to 90% chance of frost for 5 temperature thresholds
# 16º, 20º, 24º, 28º, 32º and 36º. This method is only concerned with the temperature threshold 32º.
# prob_ninety, prob_fifty, prob_ten are raw date outputs——four integer string "0820". "08" represents the month and "20" represents the day.
  def self.get_raw_probabilities(station_id)
   dates_raw = HTTParty.get("http://farmsense-prod.apigee.net/v1/frostdates/probabilities/?station=#{station_id}&season=2")
        dates_response = JSON.parse(dates_raw)
        thirty_two = dates_response[1]

        prob_ninety = thirty_two.fetch("prob_90")
        prob_fifty = thirty_two.fetch("prob_50")
        prob_ten = thirty_two.fetch("prob_10")

      probability_dates_raw = [prob_ninety, prob_fifty, prob_ten]
  end

  def self.get_days(days)
   day = days.slice(2,4)
   return day
  end

  def self.get_months(probs)
    month = probs.slice(0, 2)
    months_hash = {"01" => "January",
      "02" => "February",
      "03" => "March",
      "04" => "April",
      "05" => "May",
      "06" => "June",
      "07" => "July",
      "08" => "August",
      "09" => "September",
      "10" => "October",
      "11" => "November",
      "12" => "December"
    }
    months_hash.fetch(month)
  end
end

# == Schema Information
#
# Table name: frost_dates
#
#  id                  :integer          not null, primary key
#  zipcode             :integer
#  prob_fifty_percent  :date
#  pob_ten_percent     :date
#  prob_nintey_percent :date
#  created_at          :datetime
#  updated_at          :datetime
#

class FrostDate < ActiveRecord::Base
  # include 'HTTParty'
  belongs_to :user

  def self.get_station(latitude, longitude)
    raw_response = HTTParty.get("http://farmsense-prod.apigee.net/v1/frostdates/stations/?lat=#{latitude}8&lon=#{longitude}")
    response = JSON.parse(raw_response)
    station_id = response[0]["id"]
  end

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

  def self.save_to_db(array)
     binding.pry
    if logged_in?
      #does this know to connect to the current user id's session or not?
      # user = User.find_by(id: session[:user_id])
      @frost_dates = FrostDate.new(
        prob_nintey_percent: array[0],
        prob_fifty_percent: array[1],
        prob_ten_percent: array[2]
        )
      @frost_dates.save
    end
  end
end

# - HTTParty.get('http://farmsense-prod.apigee.net/v1/frostdates/probabilities/?station=104455&season=1')
# #for geocoder
#     # query = params[:zipcode]
    # lattitude = query[0]["lat"]
    # longitude = query[0]["lon"]
    # @zipocde = {}

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

  BASE_URL = "http://farmsense-prod.apigee.net/v1/frostdates/stations/?"

   def self.get_probabilities(latitude, longitude)


    raw_response = HTTParty.get("http://farmsense-prod.apigee.net/v1/frostdates/stations/?lat=#{latitude}8&lon=#{longitude}")

    response = JSON.parse(raw_response)
    station_id = response[0]["id"]

  # stations = HTTParty.get('http://farmsense-prod.apigee.net/v1/frostdates/stations/?lat=43.42332138&lon=-112.01243728')

    dates_raw = HTTParty.get("http://farmsense-prod.apigee.net/v1/frostdates/probabilities/?station=#{station_id}&season=2")
      dates_response = JSON.parse(dates_raw)
      thirty_two = dates_response[1]

      prob_ninety = thirty_two.fetch("prob_90")
      prob_fifty = thirty_two.fetch("prob_50")
      prob_ten = thirty_two.fetch("prob_10")

   # FrostDate.save_to_db(prob_ninety, prob_fifty, prob_ten)

      month_ninety = FrostDate.get_months(prob_ninety)
      day_ninety = prob_ninety.slice(2,4)

      month_fifty = FrostDate.get_months(prob_fifty)
      day_fifty = prob_fifty.slice(2,4)

      month_ten = FrostDate.get_months(prob_ten)
      day_ten = prob_ten.slice(2,4)

  # user_data = [prob_ninety, prob_fifty, prob_ten]
  frost_date_array = [month_ninety, day_ninety, month_fifty, day_fifty, month_ten, day_ten, prob_ninety, prob_fifty, prob_ten]

  end

#tried to save to the database using this method. Errored out at the if logged in.
  # def self.save_to_db(date_one, date_two, date_three)
  #   if logged_in?
  #     @frost_dates = FrostDate.new(
  #       prob_nintey_percent: date_one,
  #       prob_fifty_percent: date_two,
  #       prob_ten_percent: date_three
  #       )
  #     @frost_dates.save
  #   else
  #   end
  # end


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



# - HTTParty.get('http://farmsense-prod.apigee.net/v1/frostdates/probabilities/?station=104455&season=1')
# #for geocoder
#     # query = params[:zipcode]
    # lattitude = query[0]["lat"]
    # longitude = query[0]["lon"]
    # @zipocde = {}

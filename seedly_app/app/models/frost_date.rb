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
    # HTTParty.get(BASE_URL, :query => {
    #   lat:
    #   long:
    #   })
    response = JSON.parse(raw_response)
    binding.pry
    station_id = response[0]["id"]
  # stations = HTTParty.get('http://farmsense-prod.apigee.net/v1/frostdates/stations/?lat=43.42332138&lon=-112.01243728')

    HTTParty.get("http://farmsense-prod.apigee.net/v1/frostdates/probabilities/?station=#{station_id}&season=2")

  end
end



# - HTTParty.get('http://farmsense-prod.apigee.net/v1/frostdates/probabilities/?station=104455&season=1')
# #for geocoder
#     # query = params[:zipcode]
    # lattitude = query[0]["lat"]
    # longitude = query[0]["lon"]
    # @zipocde = {}

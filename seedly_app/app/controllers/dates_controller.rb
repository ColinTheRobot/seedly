class DatesController < ApplicationController
  def index

  end

  # def search
  #   zipcode = @dates
  #  # returns a string with an array of hashes of stations
  BASE_URL = "http://farmsense-prod.apigee.net/v1/frostdates/stations/?"

   def search
    binding.pry
    latitude = params[:latitude]
    longitude = params[:longitude]
    raw_response = HTTParty.get("http://farmsense-prod.apigee.net/v1/frostdates/stations/?lat=#{latitude}8&lon=#{longitude}")

    # HTTParty.get(BASE_URL, :query => {
    #   lat:
    #   long:
    #   })

   response = JSON.parse(raw_response)
   @station_id = response_better[0]["id"]
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

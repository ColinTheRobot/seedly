class FrostDatesController < ApplicationController
  def index

  end

  def search
  end

  def get_results
    binding.pry
    latitude = params[:latitude]
    longitude = params[:longitude]
    FrostDate.get_probabilities(latitude, longitude)
  end
  # def search
  #   zipcode = @dates
  #  # returns a string with an array of hashes of stations

end

class FrostDatesController < ApplicationController
  def index

  end

  def search
  end

  def get_results
    latitude = params[:latitude]
    longitude = params[:longitude]
    FrostDate.get_probabilities(latitude, longitude)


  end

  def show
    @prob_ninety

   # @month_ninety = FrostDate.get_months(@prob_ninety)
  end
  # def search
  #   zipcode = @dates
  #  # returns a string with an array of hashes of stations

end

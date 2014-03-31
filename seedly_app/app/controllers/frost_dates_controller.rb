class FrostDatesController < ApplicationController
  def index

  end

  def search

  end


  def search_frost_date
    latitude = params[:latitude]
    longitude = params[:longitude]
    @frost_dates = FrostDate.get_probabilities(latitude, longitude)
    render :show
  end

  def show
    @frost_dates
  end

  # def show
  #   # @prob_ninety

  #  # @month_ninety = FrostDate.get_months(@prob_ninety)
  # end
  # def search
  #   zipcode = @dates
  #  # returns a string with an array of hashes of stations

end

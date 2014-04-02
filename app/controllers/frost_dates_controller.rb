class FrostDatesController < ApplicationController
  def index
  end

  def search
    render :search
  end

# search_frost_date takes the user input lat and long to find a hash of the nearest weather stations to their locations.
# It then returns the raw dates for 90%, 50% and 10% chance of frost at the users location.
# The dates are in the format of a four integer string "0820". "08" represents the month and "20" represents the day.
# the method then saves the raw frost dates to the frost_dates table, if the user is logged in.
  def search_frost_date
    latitude = params[:latitude]
    longitude = params[:longitude]
    station_id = FrostDate.get_station(latitude, longitude)
    probability_dates_raw = FrostDate.get_raw_probabilities(station_id)
      if logged_in?
        # user_dates = FrostDate.save_to_db(probability_dates_raw)

        @frost_dates = FrostDate.new(
        prob_ninety_percent: probability_dates_raw[0],
        prob_fifty_percent: probability_dates_raw[1],
        prob_ten_percent: probability_dates_raw[2],
        user_id: session[:user_id]
        )
        # current_user.frost_date << @frost_dates
        @frost_dates.save
      end

    @month_ninety = FrostDate.get_months(probability_dates_raw[0])
    @day_ninety = FrostDate.get_days(probability_dates_raw[0])

    @month_fifty = FrostDate.get_months(probability_dates_raw[1])
    @day_fifty = FrostDate.get_days(probability_dates_raw[1])

    @month_ten = FrostDate.get_months(probability_dates_raw[2])
    @day_ten = FrostDate.get_days(probability_dates_raw[2])

    render :show
  end


  def show
    @month_ninety
    @month_fifty
    @month_ten

    @day_ninety
    @day_fifty
    @day_ten
  end
end

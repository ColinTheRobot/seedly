class FrostDatesController < ApplicationController
  def index
  end

  def search
  end


  def search_frost_date
    latitude = params[:latitude]
    longitude = params[:longitude]
    station_id = FrostDate.get_station(latitude, longitude)
    probability_dates_raw = FrostDate.get_raw_probabilities(station_id)
      if logged_in?
        FrostDate.save_to_db(probability_dates_raw)
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

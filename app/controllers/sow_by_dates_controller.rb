class SowByDatesController < ApplicationController
  def index
  end

  def create

    from = params["from_week"].to_i
    to = params["to_week"].to_i
    fixed = params["weeks"].to_i

    month =  FrostDate.get_months(FrostDate.where(user_id: current_user.id)[0].prob_fifty_percent)
    day = FrostDate.get_days(FrostDate.where(user_id: current_user.id)[0].prob_fifty_percent)

    primary_frost_date = month + day

    @from_date = Date.parse(primary_frost_date) - from.weeks
    @to_date = Date.parse(primary_frost_date) - to.weeks

    @fixed_date = Date.parse(primary_frost_date) - fixed.weeks


    #needs to be saved but am not sure how

    # @frost_dates = FrostDate.new(
    #     prob_ninety_percent: probability_dates_raw[0],
    #     prob_fifty_percent: probability_dates_raw[1],
    #     prob_ten_percent: probability_dates_raw[2],
    #     user_id: session[:user_id]
    #     )
    #     # current_user.frost_date << @frost_dates
    #     @frost_dates.save

  end


end

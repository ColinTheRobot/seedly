class SowByDatesController < ApplicationController
  def index
  end

  def create

    from = params["from_week"].to_i
    to = params["to_week"].to_i

    month =  FrostDate.get_months(FrostDate.where(user_id: current_user.id)[0].prob_fifty_percent)
    day = FrostDate.get_days(FrostDate.where(user_id: current_user.id)[0].prob_fifty_percent)

    primary_frost_date = month + day

    @from_date = Date.parse(primary_frost_date) - from.weeks
    @to_date = Date.parse(primary_frost_date) - to.weeks

binding.pry
  end


end

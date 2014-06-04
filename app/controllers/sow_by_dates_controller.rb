class SowByDatesController < ApplicationController
  def index
   @seeds = Seed.where(user_id: current_user.id)
  end

  def update
    from = params["from_week"].to_i
    to = params["to_week"].to_i
    fixed = params["weeks"].to_i

    month =  FrostDate.get_months(FrostDate.where(user_id: current_user.id)[0].prob_fifty_percent)
    day = FrostDate.get_days(FrostDate.where(user_id: current_user.id)[0].prob_fifty_percent)

    primary_frost_date = month + day

    @from_date = Date.parse(primary_frost_date) - from.weeks
    @to_date = Date.parse(primary_frost_date) - to.weeks

    @fixed_date = Date.parse(primary_frost_date) - fixed.weeks

        if fixed == 0
            @seed = Seed.find_by(id: params["user"]["seed_id"])
            @seed.update(calculated_sow_by_dates: @seed.calculated_sow_by_dates + [ @from_date, @to_date ])
            redirect_to root_path
        else
            @seed = Seed.find_by(id: params["user"]["seed_id"])
            @seed.update(calculated_sow_by_dates: @seed.calculated_sow_by_dates + [ @from_date, @to_date ])
            redirect_to root_path
        end

    end
end

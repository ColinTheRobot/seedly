class SeedsController < ApplicationController

  def index
    @seeds = Seed.all(:user_id == current_user[:id])
  end

  def new
    @seed = Seed.new
  end

  def create
    @seed = Seed.new(seed_params)
    current_user.seeds << @seed
      if @seed.save
        redirect_to("/")
      else
        render :new
      end
  end

  def edit
    @seed = Seed.find(params[:id])
  end

  def update
    @seed = Seed.find(params[:id])
    if @seed.update(seed_params)
      redirect_to seeds_path
    else
      render :edit
    end
  end

  def destroy
    seed = Seed.find(params[:id])
    seed.destroy
    redirect_to seeds_path
  end

  private
  def seed_params
    params.require(:seed).permit(
      :variety,
      :suggested_sowing_date,
      :date_sown,
      :germ_soil_temp,
      :seed_depth,
      :germination_days,
      :height_when_mature,
      :thin_to_grow,
      :optimum_soil_ph,
      :optimum_soil_temp,
      :days_to_harvest,
      :planting_info,
      :bed_id
      )
  end

end

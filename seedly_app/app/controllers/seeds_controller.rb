class SeedsController < ApplicationController

  def index
    @seeds = Seed.all
  end

  def new
    @seed = Seed.new
  end

  def create
    @seed = Seed.new(seed_params)
      if @seed.save
        redirect_to("/")
      else
        render :new
      end
  end

end

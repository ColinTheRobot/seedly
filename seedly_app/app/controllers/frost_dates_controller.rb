class FrostDatesController < ApplicationController
  def index

  end

  def search

  end

  def create
    binding.pry
    if logged_in?
      #does this know to connect to the current user id's session or not?
      # user = User.find_by(id: session[:user_id])
      @frost_dates = FrostDate.new(
        prob_nintey_percent: frost_dates[6],
        prob_fifty_percent: frost_dates[7],
        prob_ten_percent: frost_dates[8]
        )
      @frost_dates.save
    end
  end


  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to("/artists")
    else
      render :new
    end
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

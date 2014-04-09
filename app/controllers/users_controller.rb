class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        redirect_to("/")
      else
      # renders the new.html.erb file with @user
        render :new
      end
  end

  def show
    @user = current_user
  end

private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
      )
  end
end

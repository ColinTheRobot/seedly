class SessionController < ApplicationController
  def new
    user = User.new
  end

  def create
    @current_user
    binding.pry
    user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to("/users/#{user.id}")
      else
        render(:new)
      end
  end

  def destroy
    session[:user_id] = nil
    redirect_to(root_path)
  end
end

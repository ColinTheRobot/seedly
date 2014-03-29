class UserController < ApplciationController

  def new
    @user = User.new
  end

  def create
    @user = User.new({
      name: params[:user][:name],
      email: params[:user][:email],
      password: params[:user][:password],
      password_confirmation: params[:user][:password_confirmation]
    })
    if @user.save
      redirect_to("/")
    else
      # render the new.html.erb file with @user
      render :new
    end
  end
end

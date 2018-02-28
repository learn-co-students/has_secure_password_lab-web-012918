class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if user_params[:password] == user_params[:password_confirmation]
      @user = User.new(user_params)
      @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  def index
    @user = session[:name]
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end

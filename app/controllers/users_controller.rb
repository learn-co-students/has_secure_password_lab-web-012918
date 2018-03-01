class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if params[:user][:password] == params[:user][:password_confirmation]
      @user = User.create(users_params)
      session[:user_id] = @user.id
      redirect_to '/users/home'

    else
      redirect_to '/users/new'
    end

  end

  def home

  end

  private

  def users_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end

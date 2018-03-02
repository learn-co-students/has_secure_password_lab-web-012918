class UsersController < ApplicationController

  def welcome
    if session[:user_id] == nil
      render :'/sessions/new'
    end
    @user = User.find(session[:user_id])
  end

  def new
    @user.new
  end

  def create
    if params[:user][:password] != params[:user][:password_confirmation]
      redirect_to '/users/new'
    else
      @user = User.create(user_params)
      session[:user_id] = @user.id
      render :welcome
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end

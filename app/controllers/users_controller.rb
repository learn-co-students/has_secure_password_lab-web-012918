class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      render :homepage
    else
      redirect_to '/users/new'
    end
  end

  def homepage
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end

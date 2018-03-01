class UsersController < ApplicationController
  def new
    @user.new
  end

  def create
    if params[:user][:password] == params[:user][:password_confirmation]
    @user = User.create(users_params)
    session[:user_id] = @user.id
    redirect_to '/users/index'

    else
      redirect_to '/users/new'
    end
  end

 private

  def users_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end

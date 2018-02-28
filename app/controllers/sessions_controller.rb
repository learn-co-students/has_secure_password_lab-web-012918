class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(params[:name])
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
    # redirect_to '/login' unless @user.authenticate(params[:password])
    # session[:user_id] = @user.id
  end

  def destroy
    session.delete :name
    session.delete :password
    redirect_to '/login'
  end
end

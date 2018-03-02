class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # binding.pry
    @user = User.find_by_name(params[:user][:name])
    # binding.pry
    if @user.authenticate(params[:user][:password]) != nil
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to  '/sessions/new'
    end
  end
end

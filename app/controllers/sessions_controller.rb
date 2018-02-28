class SessionsController < ApplicationController

  def new
  end

  def create
    # binding.pry
    @user = User.find_by(name: params[:user][:name])
    return head(:forbidden) unless @user.authenticate(params[:user][:password])
    # if @user.password_digest == params[:user][:password]
    session[:user_id] = @user.id
    # end
  end
end

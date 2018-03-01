class SessionsController < ApplicationController

  def new
  end

  def create
    if params[:user][:password] || params[:user][:password] != ""
      if params[:user]
        @user = User.find_by(name: params[:user][:name])
        return head(:forbidden) unless
        @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to 'users/homepage'
      else
        render :new
      end
    end
  end
end

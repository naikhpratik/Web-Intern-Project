class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
  end

  def create
    user = User.find_by(name: params[:name])
    #isadmin = user.find_by(Isadmin: params[:Isadmin])
    if user and user.authenticate(params[:password])
      #if isadmin
      session[:user_id] = user.id
      session[:user_name] = user.name
      redirect_to admin_url
    else
      redirect_to login_url, alert: "Invalid user/password combination"
      end
  #  end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to login_url, alert: "User logged out :D"
  end
end

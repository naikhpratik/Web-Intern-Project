class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
  end

  def create
    user = User.find_by(name: params[:name])
    user_id = User.find_by(id: session[:user_id])
    if user and user.authenticate(params[:password]) and user.Isadmin
      session[:user_id] = user.id
      session[:user_name] = user.name
      flash[:notice] = "hello"
      redirect_to admin_url, alert: "Admin Logged in"
    elsif user and user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:user_name] = user.name
      redirect_to userpage_path
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end


  def destroy
  	session[:user_id] = nil
  	redirect_to login_url, alert: "User logged out :D"
  end
end

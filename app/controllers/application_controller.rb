class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #before_action :authorize
  #before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def authorize
  #unless User.find_by(id: session[:user_id])
#    redirect_to login_url, alert: "You thought you could gain unauthorised access? LOL"
  #end
  end
end

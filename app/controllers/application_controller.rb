class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #skip_before_action :verify_authenticity_token, :only => [:index, :show]

  # Catch all CanCan errors and alert the user of the exception
  rescue_from CanCan::AccessDenied do | exception |
    redirect_to root_url, alert: exception.message
  end
end

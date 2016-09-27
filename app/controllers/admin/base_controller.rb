class Admin::BaseController < ApplicationController
  load_and_authorize_resource
  # before_action :authorized?

	def authorized?
    if !current_user || !current_user.is_admin?
      flash[:alert] = "You're not authorized to access this page."
      redirect_to root_path
    end

    puts "*****************************"
    puts params.inspect
    puts "*****************************"

    # if can? params[:action], User
    #   redirect_to new_admin_user_url
    # else
    #   redirect_to dashboard_url
    # end
  end
end

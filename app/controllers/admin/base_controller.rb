class Admin::BaseController < ApplicationController
	before_action :authorized?

	def authorized?
    if !current_user || !current_user.is_admin?
      flash[:notice] = "You're not authorized to access this page."
      redirect_to root_path
    end
  end
end

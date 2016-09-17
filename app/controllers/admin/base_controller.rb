class Admin::BaseController < ApplicationController
	before_filter :authorized?

	def authorized?
    if !current_user.isadmin
      flash[:notice] = "You're not authorized to access an Admin page."
      redirect_to root_path
    end
  end
end

class AdminController < ApplicationController
  before_action :set_user, only: [:logout]
  skip_before_action :authorize, only: [:logout]

  def index
    @user = User.new
  end

  #logout
  def logout

  	session[:user_id] = nil
  	redirect_to login_url, alert: "User logged out :D"
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end

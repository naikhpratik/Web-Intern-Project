class Admin::UsersController < Admin::BaseController
  def index
  	@users = User.all_except(current_user)
  end

  def make_admin
  	u = User.find(params[:user_id])
  	u.isadmin = u.isadmin ? false : true

  	if u.save
  		flash[:notice] = "Successfully updated the User record."
  	else
  		flash[:error] = "There was some problem updating the User record. Please try again."
  	end

  	redirect_to admin_users_path
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
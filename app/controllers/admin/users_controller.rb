class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
  	@users = User.all_except(current_user)
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
    @user_roles = @user.roles.map(&:name)
  end

  def create
    @user = User.new(user_params)
    user_roles = []

    user_params[:role_ids].each do |role_id|
      user_roles.push(UserRole.create({user_id: @user.id, role_id: role_id})) unless role_id.blank?
    end

    @user.user_roles = user_roles

    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_user_url(@user), notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @user.user_roles.destroy

    respond_to do |format|
      if (password_upchanged? && @user.update_without_password(user_params)) || @user.update(user_params)
        format.html { redirect_to admin_user_url(@user), notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url, notice: 'User was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation).tap do |whitelisted|
        whitelisted[:role_ids] = get_new_ids params[:role_ids]
      end
    end

    def password_upchanged?
      user_params[:password].blank?
    end

    # TODO: Find a better alternative
    def get_new_ids role_names
      roles = Role.all.select(:name, :id)
      role_names = role_names
      role_ids = []

      role_names.each do |role_name|
        roles.each do |role|
          role_ids.push(role.id) if role.name == role_name
        end
      end

      role_ids
    end
end

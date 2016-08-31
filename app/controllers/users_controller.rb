class UsersController < ApplicationController
  before_action :configure_sign_in_params, only: [:create]
  #before_action :set_user, only: [:show, :edit, :update, :destroy]
  # skip_before_action :authorize, only: [:new,:create,:index,:update,:edit,:show]
  # GET /users
  # GET /users.json
  def index
    #@users = current_user.all? { |e|  }
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create

  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update

  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy

  end

  def makeadmin
    @users = User.find(params[:id])
    if !@users.isadmin
      @users.isadmin=1
      @users.save
      respond_to do |format|
      format.html { redirect_to users_path, notice: 'User is admin now' }
      format.json { head :no_content }
      end
      else
      @users.isadmin=0
      @users.save
      respond_to do |format|
      format.html { redirect_to users_path, notice: 'User is not an admin now' }
      format.json { head :no_content }
      end
    end
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

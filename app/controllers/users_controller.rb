class UsersController < ApplicationController
  before_action :require_owner, only: [:edit, :update, :destroy]
  def index
    @users = User.where(:role => 'editor')
  end
  def show
    @user = User.find(params[:id])
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You are signed"
      redirect_to root_path
    else
      flash.now[:error] = "Please fix all errors"
      render 'new'
    end
  end
  def edit
    # require_owner
  end
  def update
    # require_owner
    if @user.update(user_params)
      flash[:notice] = "Profile updated"
      redirect_to user_path(@user) and return
    else
      flash.now[:error] = "Please fix all errors"
      render 'edit'
    end
  end
  private
  def ami? user
    return user.present? && user.id == session[:user_id]
  end
  def require_owner
    @user = User.find_by_id(params[:id])
    unless ami? @user
      flash[:error] = "Only user can do this!"
      redirect_to users_path
    end
  end
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :bio, :password, :password_confirmation)
  end
end

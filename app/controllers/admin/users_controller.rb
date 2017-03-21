class Admin::UsersController < ApplicationController
  layout "admin"
  before_action :require_admin
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
    render 'users/show'
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User created"
      redirect_to admin_users_path and return
    else
      flash.now[:error] = "Please fix all errors"
      render 'new'
    end
  end
  def edit
    @user = User.find_by_id(params[:id])
  end
  def update
    @user = User.find_by_id(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Profile updated"
      redirect_to admin_users_path and return
    else
      flash.now[:error] = "Please fix all errors"
      render 'edit'
    end
  end
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :bio, :role, :password, :password_confirmation)
  end
end

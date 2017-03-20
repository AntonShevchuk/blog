class UsersController < ApplicationController
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
    @user = User.find_by_id(params[:id])
    ami? @user
  end
  def update
    @user = User.find_by_id(params[:id])
    ami? @user
    if @user.update(user_params)
      flash[:notice] = "Profile saved"
      redirect_to user_path(:id => @user.id)
    else
      flash.now[:error] = "Please fix all errors"
      render 'edit'
    end
  end
  private
  def ami? user
    unless user.present?
      flash[:alert] = "User not found"
      redirect_to users_path
      return nil
    end
    if user.id != session[:user_id]
      redirect_to user_path(:id => user.id)
    end
  end
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :bio, :password, :password_confirmation)
  end
end

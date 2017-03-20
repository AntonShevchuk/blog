class SessionsController < ApplicationController
  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:notice] = "You are signed"
      redirect_to root_path
    else
      flash[:error] = "Invalid credentials"
      redirect_to login_path
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end

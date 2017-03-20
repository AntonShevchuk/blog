class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :archive_data

  def archive_data
    @archive_data ||= Page.select('strftime("%Y", created_at) as year, strftime("%m", created_at) as month').distinct
  end
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  def require_user
    if (!current_user)
      flash[:alert] = "Please login before to continue"
      redirect_to login_path
    end
  end
  def require_editor
    require_user
    redirect_to root_path unless (current_user.editor? || current_user.admin?)
  end
  def require_admin
    require_user
    redirect_to root_path unless current_user.admin?
  end
end

class ApplicationController < ActionController::Base
  #before_action :archive_data
  helper_method :archive_data, :category_data, :current_user, :admin?
  protect_from_forgery with: :exception

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  # Before all actions
  # Get data for archive sidebar
  def archive_data
    @archive_data ||= Page.select('strftime("%Y", created_at) as year, strftime("%m", created_at) as month').distinct
  end
  # Get data for categories sidebar
  def category_data
    @category_data ||= Category.joins(:pages).group('categories.id').select('categories.id, categories.name, COUNT(*) as quantity')
  end
  # Helper method
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  # Helper method
  def admin?
    current_user.present? ? current_user.role == 'admin' : false
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

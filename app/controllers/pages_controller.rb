class PagesController < ApplicationController
  before_action :require_user, only: [:new, :edit, :update, :destroy]
  helper_method :owner?
  def index
    @pages = Page.all
  end
  def show
    @page = Page.find(params[:id])
    @older = Page.where('created_at < ?', @page.created_at).order('created_at DESC').take
    @newer = Page.where('created_at > ?', @page.created_at).take
  end
  def new
    @page = Page.new
  end
  def create
    @page = Page.new(page_params)
    @page.user_id = session[:user_id]
    if @page.save
      flash[:notice] = "Page created"
      redirect_to page_path @page
    else
      flash.now[:error] = "Please fix all errors"
      render 'new'
    end
  end
  def edit
    @page = Page.find_by_id(params[:id])
    require_owner @page
    render 'new'
  end
  def update
    @page = Page.find_by_id(params[:id])
    require_owner @page
    if @page.update(page_params)
      flash[:notice] = "Page updated"
      redirect_to page_path(:id => @page.id)
    else
      flash.now[:error] = "Please fix all errors"
      render 'new'
    end
  end
  def destroy
    @page = Page.find_by_id(params[:id])
    require_owner @page
    owner_id = @page.user_id
    @page.destroy
    flash[:notice] = "Page removed"
    redirect_to user_path(:id => owner_id)
  end
  def archive
    first = Date.new(params[:year].to_i, params[:month].to_i, 01)
    last = first + 1.month
    @pages = Page.where('created_at BETWEEN ? AND ?', first, last)
    @date = first.strftime('%B %Y')
  end
  private
  # Helper
  def owner? page
    if page.present?
      return page.user_id == session[:user_id]
    end
    return false
  end
  def require_owner page
    unless page.present?
      flash[:alert] = "Page not found"
      redirect_to pages_path and return
    end
    if page.user_id != session[:user_id]
      redirect_to page_path(:id => page.id) and return
    end
  end
  def page_params
    params.require(:page).permit(:title, :content, :category_id)
  end
end

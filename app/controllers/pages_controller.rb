class PagesController < ApplicationController
  before_action :require_user, only: [:new, :edit, :update, :destroy]
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
  def archive
    first = Date.new(params[:year].to_i, params[:month].to_i, 01)
    last = first + 1.month
    @pages = Page.where('created_at BETWEEN ? AND ?', first, last)
    @date = first.strftime('%B %Y')
  end
  private
  def page_params
    params.require(:page).permit(:title, :content, :category_id)
  end
end

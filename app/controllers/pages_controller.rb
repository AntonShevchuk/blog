class PagesController < ApplicationController
  before_action :require_user, only: [:new, :edit, :update, :destroy]
  def new
    @page = Page.new
  end
  def index
    @pages = Page.all
  end
  def show
    @page = Page.find(params[:id])
    @older = Page.where('created_at < ?', @page.created_at).take
    @newer = Page.where('created_at > ?', @page.created_at).take
  end
  def archive
    first = Date.new(params[:year].to_i, params[:month].to_i, 01)
    last = first + 1.month
    @pages = Page.where('created_at BETWEEN ? AND ?', first, last)
    render 'index'
  end
end

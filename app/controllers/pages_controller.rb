class PagesController < ApplicationController
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
end

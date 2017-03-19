class PagesController < ApplicationController
  def new
    @page = Page.new
  end
  def index
    @pages = Page.all
  end
  def show
    @page = Page.find(params[:id])
  end
end

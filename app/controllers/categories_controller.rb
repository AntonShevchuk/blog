class CategoriesController < ApplicationController
  before_action :require_admin, only: [:new, :edit, :update, :destroy]
  def new
    @category = Category.new
  end
  def index
    @categories = Category.all
  end
  def show
    @category = Category.find(params[:id])
    @pages = @category.pages
  end
end

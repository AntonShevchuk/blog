class CategoriesController < ApplicationController
  before_action :require_admin, only: [:new, :create, :edit, :update, :destroy]
  def index
    @categories = Category.all
  end
  def show
    @category = Category.find(params[:id])
    @pages = @category.pages
  end
  def show_by_name
    @category = Category.where(name: params[:name]).take
    @pages = @category.pages
    render 'show'
  end
  def new
    @category = Category.new
  end
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category created"
      redirect_to categories_path
    else
      flash.now[:error] = "Please fix all errors"
      render 'new'
    end
  end
  def edit
    @category = Category.find(params[:id])
    render 'new'
  end
  def update
    @category = Category.find_by_id(params[:id])
    if @category.update(category_params)
      flash[:notice] = "Category updated"
      redirect_to categories_path
    else
      flash.now[:error] = "Please fix all errors"
      render 'new'
    end
  end
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = "Category removed"
    redirect_to categories_path
  end
  private
  def category_params
    params.require(:category).permit(:name)
  end
end

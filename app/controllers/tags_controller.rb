class TagsController < ApplicationController
  before_action :require_user, only: [:new, :edit, :update, :destroy]
  def index
    @tags = Tag.all
  end
  def show
    @tag = Tag.find(params[:id])
    @pages = @tag.pages
  end
  def new
    @tag = Tag.new
  end
end

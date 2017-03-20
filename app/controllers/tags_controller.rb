class TagsController < ApplicationController
  before_action :require_user, only: [:new, :edit, :update, :destroy]
  def index
    @tags = Tag.joins(:parts).group('tags.id').select('tags.id, tags.name, COUNT(*) as quantity')
  end
  def show
    @tag = Tag.find(params[:id])
    @pages = @tag.pages
  end
  def new
    @tag = Tag.new
  end
end

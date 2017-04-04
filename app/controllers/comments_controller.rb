class CommentsController < ApplicationController
  before_action :require_user, only: [:new, :create, :edit, :update, :destroy]
  def index
    @comments = Page.find(params[:page_id]).comments
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = session[:user_id]
    @comment.page_id = params[:page_id]
    if @comment.save
      flash[:notice] = "Comment added"
      redirect_to page_path(:id => @comment.page_id)
    else
      flash.now[:error] = "Please fix all errors"
      render 'new'
    end
  end

  def edit
    # require_owner or require_admin
    render 'new'
  end

  def update
    # require_owner or require_admin
    if @comment.update(comment_params)
      flash[:notice] = "Comment updated"
      redirect_to page_path(:id => @comment.page_id)
    else
      flash.now[:error] = "Please fix all errors"
      render 'new'
    end
  end

  def destroy
    # require_owner or require_admin
    page_id = @comment.page_id
    @comment.destroy
    flash[:notice] = "Comment removed"
    redirect_to page_path(:id => page_id)
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :page_id)
  end
end

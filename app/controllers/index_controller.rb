class IndexController < ApplicationController
  before_action :require_user, only: [:new, :edit, :update, :destroy]
  def index
  end
end

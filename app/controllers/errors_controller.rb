class ErrorsController < ApplicationController
  # @link https://wearestac.com/blog/dynamic-error-pages-in-rails
  def show
    render status_code.to_s, :status => status_code
  end
protected
  def status_code
    params[:code] || 500
  end
end

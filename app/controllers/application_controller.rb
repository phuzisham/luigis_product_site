class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    @topThree = Product.topThree.limit(3)
    @featured = Product.featured.first
  end

  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end
end

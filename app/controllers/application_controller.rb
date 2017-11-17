class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    @topThree = Product.topThree.limit(3)
    @featured = Product.featured.first
  end
end

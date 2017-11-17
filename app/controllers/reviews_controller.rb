class ReviewsController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
    @reviews = @product.reviews
  end

  def new
    @product = Product.find(params[:product_id])
    @review = Review.new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      flash[:notice] = "Review successfully added!"
      redirect_to review_path(@product)
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
    @reviews = @product.reviews
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to product_reviews_path(@review.product_id)
  end

  private
    def review_params
      params.require(:review).permit(:title, :product_id)
    end
end

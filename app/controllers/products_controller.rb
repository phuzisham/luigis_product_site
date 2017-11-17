class ProductsController < ApplicationController
  def index
    @topThree = Product.topThree.limit(3)
    @featured = Product.featured.first
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product successfully added!"
      redirect_to products_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

private
  def product_params
    params.require(:product).permit(:title)
  end
end

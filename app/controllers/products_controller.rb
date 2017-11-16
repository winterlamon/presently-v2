class ProductsController < ApplicationController

  def index
    if params[:category_id] && params[:price]
      @category = Category.find(params[:category_id])
      @products = @category.products
    else
      @products = Product.all
    end
  end

  def edit
    @product = Product.find(product_params)
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :search, :description, :image_url, :catergory_id)
  end
end

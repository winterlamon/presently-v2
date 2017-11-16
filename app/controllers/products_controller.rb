class ProductsController < ApplicationController

  def index
    product_and_category_creator
    if params[:category_id]
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

class ProductsController < ApplicationController

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
    params.require(:product).permit(:name, :price)
  end
end

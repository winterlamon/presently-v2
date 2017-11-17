class ProductsController < ApplicationController


  def index
    if params[:category_id]
      id = params[:category_id].to_i
      if id == 0
        @products = Product.all
      else
        category = Category.find(id)
          if params[:price]
            all_products = Product.dollar_range(params[:price])
            @products = all_products.where(category: category)
          else
            @products = Product.where(category: category)
          end
      end
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
    params.require(:product).permit(:name, :price, :search, :description, :image_url, :category_id)
  end
end

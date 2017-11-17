class ProductsController < ApplicationController


  def index
    @previous_category = params[:category_id]
    @previous_price = params[:price]
    if params[:category_id] #&& params[:price]
      id = params[:category_id].to_i
    ####### NEW CODE
      # price_id = params[:price]
      if id == 0 #&& price_id == 0
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

  # def favorite
  #   @product = Product.find(params[:id])
  #   type = params[:type]
  #   if type == "favorite"
  #     current_user.favorites << @product
  #     redirect_to user_path, notice: 'Added to favorites'
  #
  #   elsif type == "unfavorite"
  #     current_user.favorites.delete(@product)
  #     redirect_to product_path, notice: 'Removed from favorites'
  #
  #   else
  #     # Type missing, nothing happens
  #     redirect_to product_path, notice: 'Nothing happened.'
  #   end
  # end

  private

  def product_params
    params.require(:product).permit(:name, :price, :search, :description, :image_url, :category_id)
  end

end

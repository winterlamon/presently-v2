class UserProductsController < ApplicationController

  def new
    @favorite = UserProduct.new
  end

  def create
    @favorite = UserProduct.new(user_product_params)
    if @favorite.save
      redirect_to user_path(session[:user_id])
    else
      redirect_to products_pathn
    end
  end

  private

  def user_product_params
    params.require(:user_product).permit(:product_id, :user_id)
  end

end

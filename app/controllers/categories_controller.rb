class CategoriesController < ApplicationController

  def index
    get_all_etsy_listings
  end

  def show
    @category = Category.find(params[:id])
    get_all_etsy_listings
  end


end

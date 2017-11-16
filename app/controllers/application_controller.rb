class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :require_user


  def product_and_category_creator
    @api = "https://openapi.etsy.com/v2/listings/active?includes=Images(url_170x135)&fields=title,price,description,url,category_id&limit=1000&api_key=z6u2v4p18o5m8va3gpv5132a"
    counter = 0
    newData = []
    while counter < 100 do
      all_listings = RestClient.get(@api, {params:{offset: counter}})
      listings = JSON.parse(all_listings)
      newData << listings["results"]
      counter += 100
    end
    fullData = newData.flatten
    fullData.each do |obj|
      if ["taxonomy_path"][0] != nil
        category = Category.find_or_create_by(name: ["taxonomy_path"][0])
        product = Product.find_or_create_by(name: ["title"], description: ["description"], price: ["price"], image_url: ["Images"][0]["url_170x135"], category_id: category)
      end
    end
  end

  def all_category_names
    Category.all.map {|category| puts category.name }
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!session[:user_id]
  end

  def require_user
    redirect_to '/login' unless current_user
  end

end

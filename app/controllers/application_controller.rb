class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def product_and_category_creator
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


end

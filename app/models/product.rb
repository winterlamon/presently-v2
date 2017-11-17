class Product < ApplicationRecord
  belongs_to :category

  def self.search(search)
    if search
      category = Category.find(search)
      if category
        self.where(category_id: category.id)
          if price
      else
        Product.all
      end
    else
      Product.all
    end
  end

  def dollar_range(price)
    # remvoe $ split string

    if price = "$0-25"
    elsif price = "26-50"
    elsif price = "51-75"
    elsif price = "76-100"
    end
    end
  end
end

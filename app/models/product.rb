class Product < ApplicationRecord
  belongs_to :category

  def self.search(search)
    if search
      category = Category.find(search)
      if category
        self.where(category_id: category.id)
      else
        Product.all
      end
    else
      Product.all
    end
  end
end

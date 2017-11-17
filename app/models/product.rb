class Product < ApplicationRecord
  belongs_to :category
  has_many :user_products
  has_many :users, through: :user_products

 #  def self.search(search)
 #    if search
 #      category = Category.find(search)
 #      if category
 #        self.where(category_id: category.id)
 #          if price
 #        self.where(category_id: category.id).dollar_range
 #      else
 #        Product.all
 #      end
 #    end
 #  end

 def self.dollar_range(price)
     if price == "$0-25"
       self.where(price: [0..25])
     elsif price == "$26-50"
       self.where(price: [25..50])
     elsif price == "$51-75"
       self.where(price: [50..75])
     elsif price == "$76-100"
       self.where(price: [75..100])
     else
       self.where(price: [100..1000])
     end
  end

end

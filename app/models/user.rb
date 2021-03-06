class User < ApplicationRecord
  has_secure_password
  has_many :user_categories
  has_many :categories, through: :user_categories
  accepts_nested_attributes_for :categories
  has_many :user_products
  has_many :products, through: :user_products
  has_many :friendships
  has_many :friends, through: :friendships


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_email_format_of :email, :message => 'is not a valid email.'
  validates :password, length: {minimum: 8}
  # validates :category_ids, length: {is: 3, :message => "Please select 3 categories."}

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def category_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      category = Category.find_or_create_by(category_attribute)
      self.categories << category
    end
  end
end

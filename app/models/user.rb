class User < ApplicationRecord
  has_secure_password
  has_many :user_categories
  has_many :categories, through: :user_categories
  accepts_nested_attributes_for :categories


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_email_format_of :email, :message => 'is not a valid email.'
  validates :password, length: {minimum: 8}

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

class User < ApplicationRecord
  has_many :user_categories
  has_many :categories, through: :user_categories

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_email_format_of :email, :message => 'is not a valid email.'
  validates :password, length: {minimum: 8}

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end

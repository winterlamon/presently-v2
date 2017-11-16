# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# USERS (11 users)

winter = User.create(first_name: "Winter", last_name: "LaMon", email: "winterlamon@email.com", password_digest: "password123", bio: "This is my bio. It tells you stuff about me.")
brian = User.create(first_name: "Brian", last_name: "Boisvert", email: "brianboisvert@email.com", password_digest: "password123", bio: "This is my bio. It tells you stuff about me.")
elisa = User.create(first_name: "Elisa", last_name: "Vaccaro", email: "elisavaccaro@email.com", password_digest: "password123", bio: "This is my bio. It tells you stuff about me.")
james = User.create(first_name: "James", last_name: "Graham", email: "jamesgraham@email.com", password_digest: "password123", bio: "This is my bio. It tells you stuff about me.")
dick = User.create(first_name: "Dick", last_name: "Ward", email: "dickward@email.com", password_digest: "password123", bio: "This is my bio. It tells you stuff about me.")
genevieve = User.create(first_name: "Genevieve", last_name: "Costa", email: "genevievecosta@email.com", password_digest: "password123", bio: "This is my bio. It tells you stuff about me.")
jordan = User.create(first_name: "Jordan", last_name: "Storms", email: "jordanstorms@email.com", password_digest: "password123", bio: "This is my bio. It tells you stuff about me.")
yassi = User.create(first_name: "Yassi", last_name: "Mortensen", email: "yassimortensen@email.com", password_digest: "password123", bio: "This is my bio. It tells you stuff about me.")
mimi = User.create(first_name: "Mimi", last_name: "Rahman", email: "mimirahman@email.com", password_digest: "password123", bio: "This is my bio. It tells you stuff about me.")
tim = User.create(first_name: "Tim", last_name: "Campbell", email: "timcampbell@email.com", password_digest: "password123", bio: "This is my bio. It tells you stuff about me.")
steven = User.create(first_name: "Steven", last_name: "Balasta", email: "stevenbalasta@email.com", password_digest: "password123", bio: "This is my bio. It tells you stuff about me.")


# CATEGORIES (8 categories)

jewelry_accessories = Category.create(name: "Jewelry & Accessories")
clothing_shoes = Category.create(name: "Clothing & Shoes")
home_living = Category.create(name: "Home & Living")
wedding_party = Category.create(name: "Wedding & Party")
toys_entertainment = Category.create(name: "Toys & Entertainment")
art_collectibles = Category.create(name: "Art & Collectibles")
craft_supplies_tools = Category.create(name: "Craft Supplies & Tools")
vintage = Category.create(name: "Vintage")

# PRODUCTS

def get_all_etsy_listings #parses all the data from JSON into array of hashes
  url = 'https://openapi.etsy.com/v2/listings/active?api_key=z6u2v4p18o5m8va3gpv5132a'
  uri = URI(url)
  response = Net::HTTP.get(uri)
  etsy = JSON.parse(response)
  n = 1
  listings_array = []
  100.times do
    all_listings_hash = etsy
    listings_array << all_listings_hash["results"]
    n += 1
  end
  listings_array = listings_array.flatten
  listings_array
end


# user_categories

user_category1 = UserCategory.create(user_id: 1, category_id: 2)
user_category2 = UserCategory.create(user_id: 2, category_id: 4)
user_category3 = UserCategory.create(user_id: 3, category_id: 6)
user_category4 = UserCategory.create(user_id: 4, category_id: 8)
user_category5 = UserCategory.create(user_id: 5, category_id: 1)
user_category6 = UserCategory.create(user_id: 6, category_id: 3)
user_category7 = UserCategory.create(user_id: 7, category_id: 5)
user_category8 = UserCategory.create(user_id: 8, category_id: 7)
user_category9 = UserCategory.create(user_id: 9, category_id: 2)
user_category10 = UserCategory.create(user_id: 10, category_id: 4)
user_category11 = UserCategory.create(user_id: 11, category_id: 6)
user_category12 = UserCategory.create(user_id: 1, category_id: 8)
user_category13 = UserCategory.create(user_id: 2, category_id: 1)
user_category14 = UserCategory.create(user_id: 3, category_id: 3)
user_category15 = UserCategory.create(user_id: 4, category_id: 5)
user_category16 = UserCategory.create(user_id: 5, category_id: 7)
user_category17 = UserCategory.create(user_id: 6, category_id: 2)
user_category18 = UserCategory.create(user_id: 7, category_id: 4)
user_category19 = UserCategory.create(user_id: 8, category_id: 6)
user_category20 = UserCategory.create(user_id: 9, category_id: 8)
user_category21 = UserCategory.create(user_id: 10, category_id: 1)
user_category22 = UserCategory.create(user_id: 11, category_id: 3)
user_category23 = UserCategory.create(user_id: 1, category_id: 5)
user_category24 = UserCategory.create(user_id: 2, category_id: 7)
user_category25 = UserCategory.create(user_id: 3, category_id: 2)
user_category26 = UserCategory.create(user_id: 4, category_id: 4)
user_category27 = UserCategory.create(user_id: 5, category_id: 6)
user_category28 = UserCategory.create(user_id: 6, category_id: 8)
user_category29 = UserCategory.create(user_id: 7, category_id: 1)
user_category30 = UserCategory.create(user_id: 8, category_id: 3)
user_category31 = UserCategory.create(user_id: 9, category_id: 5)
user_category32 = UserCategory.create(user_id: 10, category_id: 7)
user_category33 = UserCategory.create(user_id: 11, category_id: 2)

#

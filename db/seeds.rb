API = "https://openapi.etsy.com/v2/listings/active?includes=Images(url_170x135)&fields=title,price,description,url,category_id&limit=1000&api_key=z6u2v4p18o5m8va3gpv5132a"


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


# CATEGORIES (8 categories) -- OLD, SEE BELOW FOR GENERATION THROUGH API ITERATION

# jewelry_accessories = Category.create(name: "Jewelry & Accessories")
# clothing_shoes = Category.create(name: "Clothing & Shoes")
# home_living = Category.create(name: "Home & Living")
# wedding_party = Category.create(name: "Wedding & Party")
# toys_entertainment = Category.create(name: "Toys & Entertainment")
# art_collectibles = Category.create(name: "Art & Collectibles")
# craft_supplies_tools = Category.create(name: "Craft Supplies & Tools")
# vintage = Category.create(name: "Vintage")

# PRODUCTS & CATEGORIES

def product_and_category_creator
  counter = 0
  newData = []
  byebug
  while counter < 5000 do
    all_listings = RestClient.get(API, {params:{offset: counter}})
    listings = JSON.parse(all_listings)
    newData << listings["results"]
    counter += 100
  end
  fullData = newData.flatten
  fullData.each do |obj|
    category = Category.find_or_create_by(name: obj["taxonomy_path"][0])
    product = Product.find_or_create_by(name: obj["title"], description: obj["description"], price: obj["price"].to_f, image_url: obj["Images"][0]["url_170x135"], category_id: Category.find_by(name: obj["taxonomy_path"][0]).id)
  end
end

def all_category_names
  Category.all.map {|category| puts category.name }
end



# user_categories

user_category1 = UserCategory.create(user_id: 1, category_id: Category.all.sample.id)
user_category2 = UserCategory.create(user_id: 2, category_id: Category.all.sample.id)
user_category3 = UserCategory.create(user_id: 3, category_id: Category.all.sample.id)
user_category4 = UserCategory.create(user_id: 4, category_id: Category.all.sample.id)
user_category5 = UserCategory.create(user_id: 5, category_id: Category.all.sample.id)
user_category6 = UserCategory.create(user_id: 6, category_id: Category.all.sample.id)
user_category7 = UserCategory.create(user_id: 7, category_id: Category.all.sample.id)
user_category8 = UserCategory.create(user_id: 8, category_id: Category.all.sample.id)
user_category9 = UserCategory.create(user_id: 9, category_id: Category.all.sample.id)
user_category10 = UserCategory.create(user_id: 10, category_id: Category.all.sample.id)
user_category11 = UserCategory.create(user_id: 11, category_id: Category.all.sample.id)
user_category12 = UserCategory.create(user_id: 1, category_id: Category.all.sample.id)
user_category13 = UserCategory.create(user_id: 2, category_id: Category.all.sample.id)
user_category14 = UserCategory.create(user_id: 3, category_id: Category.all.sample.id)
user_category15 = UserCategory.create(user_id: 4, category_id: Category.all.sample.id)
user_category16 = UserCategory.create(user_id: 5, category_id: Category.all.sample.id)
user_category17 = UserCategory.create(user_id: 6, category_id: Category.all.sample.id)
user_category18 = UserCategory.create(user_id: 7, category_id: Category.all.sample.id)
user_category19 = UserCategory.create(user_id: 8, category_id: Category.all.sample.id)
user_category20 = UserCategory.create(user_id: 9, category_id: Category.all.sample.id)
user_category21 = UserCategory.create(user_id: 10, category_id: Category.all.sample.id)
user_category22 = UserCategory.create(user_id: 11, category_id: Category.all.sample.id)
user_category23 = UserCategory.create(user_id: 1, category_id: Category.all.sample.id)
user_category24 = UserCategory.create(user_id: 2, category_id: Category.all.sample.id)
user_category25 = UserCategory.create(user_id: 3, category_id: Category.all.sample.id)
user_category26 = UserCategory.create(user_id: 4, category_id: Category.all.sample.id)
user_category27 = UserCategory.create(user_id: 5, category_id: Category.all.sample.id)
user_category28 = UserCategory.create(user_id: 6, category_id: Category.all.sample.id)
user_category29 = UserCategory.create(user_id: 7, category_id: Category.all.sample.id)
user_category30 = UserCategory.create(user_id: 8, category_id: Category.all.sample.id)
user_category31 = UserCategory.create(user_id: 9, category_id: Category.all.sample.id)
user_category32 = UserCategory.create(user_id: 10, category_id: Category.all.sample.id)
user_category33 = UserCategory.create(user_id: 11, category_id: Category.all.sample.id)

#

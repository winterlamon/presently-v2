

# API = "https://openapi.etsy.com/v2/listings/active?includes=Images(url_170x135)&fields=title,price,description,url,category_id&limit=1000&api_key=z6u2v4p18o5m8va3gpv5132a"


# USERS (11 users)
winter = User.create(first_name: "Winter", last_name: "LaMon", email: "winterlamon@email.com", password: "password123", bio: "This is my bio. It tells you stuff about me.", category_ids: [Category.all.sample.id, Category.all.sample.id, Category.all.sample.id])
brian = User.create(first_name: "Brian", last_name: "Boisvert", email: "brianboisvert@email.com", password: "password123", bio: "This is my bio. It tells you stuff about me.", category_ids: [Category.all.sample.id, Category.all.sample.id, Category.all.sample.id])
elisa = User.create(first_name: "Elisa", last_name: "Vaccaro", email: "elisavaccaro@email.com", password: "password123", bio: "This is my bio. It tells you stuff about me.", category_ids: [Category.all.sample.id, Category.all.sample.id, Category.all.sample.id])
james = User.create(first_name: "James", last_name: "Graham", email: "jamesgraham@email.com", password: "password123", bio: "This is my bio. It tells you stuff about me.", category_ids: [Category.all.sample.id, Category.all.sample.id, Category.all.sample.id])
dick = User.create(first_name: "Dick", last_name: "Ward", email: "dickward@email.com", password: "password123", bio: "This is my bio. It tells you stuff about me.", category_ids: [Category.all.sample.id, Category.all.sample.id, Category.all.sample.id])
genevieve = User.create(first_name: "Genevieve", last_name: "Costa", email: "genevievecosta@email.com", password: "password123", bio: "This is my bio. It tells you stuff about me.", category_ids: [Category.all.sample.id, Category.all.sample.id, Category.all.sample.id])
jordan = User.create(first_name: "Jordan", last_name: "Storms", email: "jordanstorms@email.com", password: "password123", bio: "This is my bio. It tells you stuff about me.", category_ids: [Category.all.sample.id, Category.all.sample.id, Category.all.sample.id])
yassi = User.create(first_name: "Yassi", last_name: "Mortensen", email: "yassimortensen@email.com", password: "password123", bio: "This is my bio. It tells you stuff about me.", category_ids: [Category.all.sample.id, Category.all.sample.id, Category.all.sample.id])
mimi = User.create(first_name: "Mimi", last_name: "Rahman", email: "mimirahman@email.com", password: "password123", bio: "This is my bio. It tells you stuff about me.", category_ids: [Category.all.sample.id, Category.all.sample.id, Category.all.sample.id])
tim = User.create(first_name: "Tim", last_name: "Campbell", email: "timcampbell@email.com", password: "password123", bio: "This is my bio. It tells you stuff about me.", category_ids: [Category.all.sample.id, Category.all.sample.id, Category.all.sample.id])
steven = User.create(first_name: "Steven", last_name: "Balasta", email: "stevenbalasta@email.com", password: "password123", bio: "This is my bio. It tells you stuff about me.", category_ids: [Category.all.sample.id, Category.all.sample.id, Category.all.sample.id])



# PRODUCTS & CATEGORIES

def product_and_category_creator
  counter = 0
  newData = []
  while counter < 6000 do
    all_listings = RestClient.get("https://openapi.etsy.com/v2/listings/active?includes=Images(url_170x135)&fields=title,price,description,url,category_id&limit=1000&api_key=z6u2v4p18o5m8va3gpv5132a", {params:{offset: counter}})
    listings = JSON.parse(all_listings)
    newData << listings["results"]
    counter += 100
  end
  fullData = newData.flatten
  fullData.each do |obj|
    if obj["taxonomy_path"][0] != nil
     category = Category.find_or_create_by(name: obj["taxonomy_path"][0])
     product = Product.find_or_create_by(name: obj["title"], description: obj["description"], price: obj["price"].to_f, image_url: obj["Images"][0]["url_170x135"], listing_url: obj["url"], category_id: Category.find_by(name: obj["taxonomy_path"][0]).id)
    end
  end
end


# def all_category_names
#   Category.all.map {|category| puts category.name }
# end




# user_categories

user_category1 = UserCategory.find_or_create_by(user_id: 1, category_id: Category.all.sample.id)
user_category2 = UserCategory.find_or_create_by(user_id: 2, category_id: Category.all.sample.id)
user_category3 = UserCategory.find_or_create_by(user_id: 3, category_id: Category.all.sample.id)
user_category4 = UserCategory.find_or_create_by(user_id: 4, category_id: Category.all.sample.id)
user_category5 = UserCategory.find_or_create_by(user_id: 5, category_id: Category.all.sample.id)
user_category6 = UserCategory.find_or_create_by(user_id: 6, category_id: Category.all.sample.id)
user_category7 = UserCategory.find_or_create_by(user_id: 7, category_id: Category.all.sample.id)
user_category8 = UserCategory.find_or_create_by(user_id: 8, category_id: Category.all.sample.id)
user_category9 = UserCategory.find_or_create_by(user_id: 9, category_id: Category.all.sample.id)
user_category10 = UserCategory.find_or_create_by(user_id: 10, category_id: Category.all.sample.id)
user_category11 = UserCategory.find_or_create_by(user_id: 11, category_id: Category.all.sample.id)
user_category12 = UserCategory.find_or_create_by(user_id: 1, category_id: Category.all.sample.id)
user_category13 = UserCategory.find_or_create_by(user_id: 2, category_id: Category.all.sample.id)
user_category14 = UserCategory.find_or_create_by(user_id: 3, category_id: Category.all.sample.id)
user_category15 = UserCategory.find_or_create_by(user_id: 4, category_id: Category.all.sample.id)
user_category16 = UserCategory.find_or_create_by(user_id: 5, category_id: Category.all.sample.id)
user_category17 = UserCategory.find_or_create_by(user_id: 6, category_id: Category.all.sample.id)
user_category18 = UserCategory.find_or_create_by(user_id: 7, category_id: Category.all.sample.id)
user_category19 = UserCategory.find_or_create_by(user_id: 8, category_id: Category.all.sample.id)
user_category20 = UserCategory.find_or_create_by(user_id: 9, category_id: Category.all.sample.id)
user_category21 = UserCategory.find_or_create_by(user_id: 10, category_id: Category.all.sample.id)
user_category22 = UserCategory.find_or_create_by(user_id: 11, category_id: Category.all.sample.id)
user_category23 = UserCategory.find_or_create_by(user_id: 1, category_id: Category.all.sample.id)
user_category24 = UserCategory.find_or_create_by(user_id: 2, category_id: Category.all.sample.id)
user_category25 = UserCategory.find_or_create_by(user_id: 3, category_id: Category.all.sample.id)
user_category26 = UserCategory.find_or_create_by(user_id: 4, category_id: Category.all.sample.id)
user_category27 = UserCategory.find_or_create_by(user_id: 5, category_id: Category.all.sample.id)
user_category28 = UserCategory.find_or_create_by(user_id: 6, category_id: Category.all.sample.id)
user_category29 = UserCategory.find_or_create_by(user_id: 7, category_id: Category.all.sample.id)
user_category30 = UserCategory.find_or_create_by(user_id: 8, category_id: Category.all.sample.id)
user_category31 = UserCategory.find_or_create_by(user_id: 9, category_id: Category.all.sample.id)
user_category32 = UserCategory.find_or_create_by(user_id: 10, category_id: Category.all.sample.id)
user_category33 = UserCategory.find_or_create_by(user_id: 11, category_id: Category.all.sample.id)

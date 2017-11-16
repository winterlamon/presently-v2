class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :price
      t.string :image_url
      t.string :listing_url
      t.integer :category_id
      t.timestamps
    end
  end
end

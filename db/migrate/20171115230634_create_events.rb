class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :date
      t.integer :spending_limit
      t.string :location
      t.string :occasion
      t.timestamps
    end
  end
end

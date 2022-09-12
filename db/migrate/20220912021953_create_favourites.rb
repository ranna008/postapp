class CreateFavourites < ActiveRecord::Migration[7.0]
  def change
    create_table :favourites do |t|
      t.integer :user_id
      t.integer :post_id
      t.timestamps
    end
  end
end

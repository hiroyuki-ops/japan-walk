class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|

      t.integer :user_id
      t.text :body
      t.string :post_image_id
      t.date :shooting_date
      t.string :country_name
      t.integer :area
      t.timestamps
    end
  end
end

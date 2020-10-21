class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|

      t.integer :post_code
      t.string :address
      t.integer :latitude
      t.integer :longitude
      t.integer :post_id
      t.timestamps
    end
  end
end

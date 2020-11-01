class CreateCategoryMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :category_maps do |t|
      t.references :post, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end

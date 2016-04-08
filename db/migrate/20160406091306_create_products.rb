class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.string :style
      t.text :description
      t.string :product_image_id
      t.references :style, index: true
      t.timestamps null: false
    end
  end
end

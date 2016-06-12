class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.money :price
      t.string :style
      t.integer :cout, default: 0
      t.text :description
      t.string :product_image_id
      t.references :style, index: true
      t.timestamps null: false
    end
  end
end

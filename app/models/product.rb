class Product < ActiveRecord::Base
  attachment :product_image

  validates_presence_of :name, :price, :style
end

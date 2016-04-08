class Product < ActiveRecord::Base
  attachment :product_image

  belongs_to :style

  validates_presence_of :name, :price, :style
end

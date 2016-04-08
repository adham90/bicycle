class Product < ActiveRecord::Base
  attachment :product_image
  self.per_page = 9
  extend FriendlyId
  friendly_id :name, use: :slugged
  monetize :price
  belongs_to :style

  validates_presence_of :name, :price, :style

  scope :by_name, -> (name) { where('name like ?', "#{name}%") }
  scope :by_style, -> (style_id) { where(style_id: style_id) }
  scope :by_price, -> (max, min) { where('price < ? AND price > ?', max, min) }
end

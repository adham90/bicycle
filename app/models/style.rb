class Style < ActiveRecord::Base
  has_many :products
  validates_presence_of :name
end

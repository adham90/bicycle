class AdminController < ApplicationController
  def index
    @product = Product.all.order(:cout)
  end
end


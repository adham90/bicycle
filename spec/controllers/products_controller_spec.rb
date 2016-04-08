require 'rails_helper'

RSpec.describe ProductsController do
  include Devise::TestHelpers
  context '#unauth user' do
    it 'can\'t create new product' do
      post :create, product: FactoryGirl.attributes_for(:product)
      expect(response).to redirect_to '/'
    end

    it 'can\'t edit product' do
      product = create(:product)
      put :update, id: product.id, product: { name: 'name1' }
      expect(response).to redirect_to '/'
    end
  end
end

require 'rails_helper'

RSpec.describe ProductsController do
  include Devise::TestHelpers
  context '#auth' do
    it 'allow only admin to create new product' do
      post :create, product: FactoryGirl.attributes_for(:product)

      expect(response).to redirect_to new_user_session_path
    end
  end
end

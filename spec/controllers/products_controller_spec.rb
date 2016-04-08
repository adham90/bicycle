require 'rails_helper'

RSpec.describe ProductsController do
  include Devise::TestHelpers

  describe 'GET #index' do
    let(:product) { create(:product) }

    context 'with params[by_name]' do
      it 'populates an array of products starting with the by_name params' do
        asd_product = create(:product, name: "asd")
        asdf_product = create(:product, name: "asdf")
        qwe_product = create(:product, name: "qwe")
        get :index, by_name: "asd"
        expect(assigns(:products)).to match_array([asd_product, asdf_product])
      end

      it 'render the :index template' do
        get :index, by_name: product.name
        expect(response).to render_template :index
      end
    end

    context 'with params[by_price]' do
      it 'populates an array of products within price range' do
        product5 = create(:product, price: 5)
        product10 = create(:product, price: 10)
        product15 = create(:product, price: 15)
        product20 = create(:product, price: 20)

        get :index, by_price: {min: 8, max: 16}
        expect(assigns(:products)).to match_array([product10, product15])
      end

      it 'render the :index template' do
        get :index, by_price: {min: product.price - 1, max: product.price + 1}
        expect(response).to render_template :index
      end
    end

    context 'with params[by_style]' do
      it 'populates an array of products matches style' do
        product_style = create(:product, style: create(:style))
        get :index, by_style: product.style
        expect(assigns(:products)).to eq([product])
      end

      it 'render the :index template' do
        get :index, by_style: product.style
        expect(response).to render_template :index
      end
    end

    context 'with multiple params' do
      it 'populates an array of products based on params' do
        product2 = create(:product,
                          name: 'other',
                          style: create(:style), price: 100)

        get :index, {
                      by_name: product.name,
                      by_style: product.style,
                      by_price: { min: product.price - 1, max: product.price + 1 }
                    }

        expect(assigns(:products)).to eq([product])
      end
    end
  end

  context '#unauthenticated user' do
    it 'cannot create new product' do
      expect{ post :create, product: FactoryGirl.attributes_for(:product) }.to_not change(Product, :count)
      expect(response).to redirect_to '/'
    end

    it 'cannot edit product' do
      product = create(:product)
      expect{ put :update, id: product.id, product: { name: 'name1' } }.to_not change(Product, :name)
      expect(response).to redirect_to '/'
    end

    it 'cannot delete product' do
      product = create(:product)
      expect{ delete :destroy, id: product.id }.to_not change(Product, :count)
      expect(response).to redirect_to '/'
    end
  end
end

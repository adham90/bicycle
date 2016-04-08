require 'rails_helper'

RSpec.describe StylesController, type: :controller do
  include Devise::TestHelpers

  let(:style) { create(:style) }

  context '#unauthenticated user' do
    it 'cannot create new style' do
      expect{ post :create, style: FactoryGirl.attributes_for(:style) }.to_not change(Style, :count)
      expect(response).to redirect_to '/'
    end

    it 'cannot edit style' do
      expect{ put :update, id: style.id, style: { name: 'name1' } }.to_not change(Style, :name)
      expect(response).to redirect_to '/'
    end

    it 'cannot delete style' do
      style = create(:style)
      expect{ delete :destroy, id: style.id }.to_not change(Style, :count)
      expect(response).to redirect_to '/'
    end
  end
end

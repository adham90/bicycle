require 'rails_helper'

RSpec.describe Product, type: :model do
  context '#relations' do
  end

  context '#validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :price }
    it { is_expected.to validate_presence_of :style }
  end
end

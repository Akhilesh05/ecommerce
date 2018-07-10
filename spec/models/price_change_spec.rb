# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PriceChange, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:product) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:value) }
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Image, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:product) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:url) }
    it { is_expected.to allow_value('https://google.com/index.html').for(:url) }
    it { is_expected.not_to allow_value('google.com/index.html').for(:url) }
  end
end

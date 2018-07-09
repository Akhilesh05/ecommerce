# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PriceChange, type: :model do
  # Associations
  it { is_expected.to belong_to(:product) }
  # Validations
  it { is_expected.to validate_presence_of(:value) }
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  # Associations
  it { is_expected.to belong_to(:brand).optional }
  it { is_expected.to have_many(:images).dependent(:destroy) }
  it { is_expected.to have_many(:price_changes).dependent(:destroy) }
  # Validations
  it { is_expected.to allow_value(nil).for(:brand_id) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_most(100) }
end

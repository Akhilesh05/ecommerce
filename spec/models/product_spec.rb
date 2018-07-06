# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  # Associations
  it { should belong_to(:brand).optional }
  it { should have_many(:images).dependent(:destroy) }
  it { should have_many(:price_changes).dependent(:destroy) }
  # Validations
  it { should allow_value(nil).for(:brand_id) }
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_most(100) }
end

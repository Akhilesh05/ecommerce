# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PriceChange, type: :model do
  # Associations
  it { should belong_to(:product) }
  # Validations
  it { should validate_presence_of(:value) }
end

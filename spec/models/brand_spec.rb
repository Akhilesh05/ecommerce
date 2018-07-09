# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Brand, type: :model do
  # Associations
  it { is_expected.to have_many(:products).dependent(:destroy) }
  # Validations
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_most(50) }
end

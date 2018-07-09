# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Address, type: :model do
  # Association tests
  it { is_expected.to belong_to(:user) }
  # Validation tests
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to validate_presence_of(:mobile_number) }
  it { is_expected.to validate_presence_of(:line1) }
  it { is_expected.to validate_presence_of(:city) }
  it { is_expected.to validate_presence_of(:country) }
  it { is_expected.to validate_length_of(:first_name).is_at_least(2).is_at_most(50) }
  it { is_expected.to validate_length_of(:last_name).is_at_least(2).is_at_most(50) }
  it { is_expected.to validate_length_of(:city).is_at_least(2).is_at_most(50) }
  it { is_expected.to validate_length_of(:line1).is_at_least(2) }
  it { is_expected.to validate_length_of(:mobile_number).is_equal_to(8) }
  it { is_expected.to validate_length_of(:zip_code).is_at_most(20) }
  it { is_expected.to validate_length_of(:country).is_equal_to(2) }
end

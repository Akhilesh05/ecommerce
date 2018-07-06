# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  # Association tests
  it { should have_many(:addresses).dependent(:destroy) }

  # Validation tests
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:mobile_number) }
  it { should validate_length_of(:mobile_number).is_equal_to(8) }
  it { should validate_length_of(:first_name).is_at_least(2).is_at_most(50) }
  it { should validate_length_of(:last_name).is_at_least(2).is_at_most(50) }
  it { should validate_length_of(:nic_number).is_equal_to(14) }
  it { should validate_length_of(:passport_country_number).is_at_most(20) }
  it { should validate_length_of(:nationality).is_equal_to(2) }
  it { should validate_length_of(:email).is_at_most(100) }
  it { should validate_length_of(:password).is_at_least(8) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should validate_uniqueness_of(:nic_number).case_insensitive.allow_nil }
  it { should validate_uniqueness_of(:passport_country_number).case_insensitive.allow_nil }
  it { should allow_value('Password01').for(:password) }
  it { should_not allow_value('password01').for(:password) }
  it { should allow_value('user@example.com').for(:email) }
  it { should_not allow_value('user@example').for(:email) }
end

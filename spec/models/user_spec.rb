# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:addresses).dependent :destroy }
    it { is_expected.to have_many(:orders).dependent :destroy }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :password_digest }
    it { is_expected.to validate_presence_of :mobile_number }
    it { is_expected.to validate_inclusion_of(:gender).in_array(%w[m f]).allow_nil }
    it { is_expected.to validate_length_of(:mobile_number).is_equal_to(8) }
    it { is_expected.to validate_length_of(:first_name).is_at_least(2).is_at_most(50) }
    it { is_expected.to validate_length_of(:last_name).is_at_least(2).is_at_most(50) }
    it { is_expected.to validate_length_of(:nic_number).is_equal_to(14) }
    it { is_expected.to validate_length_of(:passport_country_number).is_at_most(20) }
    it { is_expected.to validate_length_of(:nationality).is_equal_to(2) }
    it { is_expected.to validate_length_of(:email).is_at_most(100) }
    it { is_expected.to validate_length_of(:password).is_at_least(8) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to validate_uniqueness_of(:nic_number).case_insensitive.allow_nil }
    it do
      is_expected.to validate_uniqueness_of(:passport_country_number).case_insensitive.allow_nil
    end
    it { is_expected.to allow_value('59876543').for :mobile_number }
    it { is_expected.not_to allow_value('5987654').for :mobile_number }
    it { is_expected.not_to allow_value('598765432').for :mobile_number }
    it { is_expected.not_to allow_value('5987654A').for :mobile_number }
    it { is_expected.to allow_value('Password01').for :password }
    it { is_expected.not_to allow_value('password01').for :password }
    it { is_expected.to allow_value('user@example.com').for :email }
    it { is_expected.not_to allow_value('user@example').for :email }
  end
end

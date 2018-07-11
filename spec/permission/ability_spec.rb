# frozen_string_literal: true

require 'rails_helper'
require 'cancan/matchers'

RSpec.describe Ability do
  subject(:ability) { described_class.new(user) }

  let(:user) { nil }

  context 'when normal user' do
    let(:user) { create :user }
    let(:another_user) { create :user }

    it { is_expected.to be_able_to %i[read update destroy], user }
    it { is_expected.to be_able_to :manage, user.addresses.new }
    it { is_expected.to be_able_to %i[create read destroy], user.addresses.new.orders.new }
    it { is_expected.not_to be_able_to %i[read update destroy], another_user }
    it { is_expected.not_to be_able_to :manage, another_user.addresses.new }
    it do
      is_expected.not_to be_able_to %i[create read destroy], another_user.addresses.new.orders.new
    end
  end

  context 'when guest' do
    let(:another_user) { create :user }

    it { is_expected.to be_able_to :create, User.new }
    it { is_expected.not_to be_able_to %i[read update destroy], another_user }
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EmailWorker, type: :worker do
  let(:user) { create :user }

  before do
    Sidekiq::Testing.inline!
    allow(UserMailer).to receive(:with).and_call_original
    EmailWorker.perform_async user.id
  end

  it { expect(UserMailer).to have_received(:with).with(user: user) }
end

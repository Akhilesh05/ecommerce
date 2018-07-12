# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe 'welcome_email' do
    let(:mail) { UserMailer.with(user: user).welcome_email }
    let(:user) { create :user }

    it 'renders the headers' do
      expect(mail.subject).to match 'Welcome'
      expect(mail.to).to include user.email
      expect(mail.from).to include 'user@example.com'
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match user.first_name
    end
  end
end

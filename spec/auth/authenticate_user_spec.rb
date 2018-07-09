# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AuthenticateUser do
  let(:user) { create(:user) }

  describe '#token' do
    context 'when valid credentials' do
      subject(:auth_object) { described_class.new(user.email, user.password) }

      it 'returns a token' do
        expect(auth_object.token).not_to be_nil
      end
    end

    context 'when invalid credentials' do
      subject(:auth_object) { described_class.new(user.email, "fake#{user.password}") }

      it 'raises an AuthenticationError' do
        expect do
          auth_object.token
        end.to raise_error(ExceptionHandler::AuthenticationError)
      end
    end
  end
end

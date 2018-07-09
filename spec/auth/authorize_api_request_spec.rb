# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AuthorizeApiRequest do
  let(:user) { create(:user) }
  let(:authorization_header) { token_generator(user.id) }
  let(:invalid_request_object) { described_class.new(nil) }
  let(:request_object) { described_class.new(authorization_header) }

  describe '#user' do
    context 'when valid request' do
      it 'returns user object' do
        expect(request_object.user).to eq(user)
      end
    end

    context 'when invalid request' do
      context 'when token missing' do
        it 'raises a MissingToken error' do
          expect do
            invalid_request_object.user
          end.to raise_error(ExceptionHandler::MissingToken)
        end
      end

      context 'when invalid token' do
        let(:invalid_request_object) { described_class.new "fake#{authorization_header}" }

        it 'raises an InvalidToken error' do
          expect do
            invalid_request_object.user
          end.to raise_error(ExceptionHandler::InvalidToken)
        end
      end

      context 'when token user not found' do
        let(:invalid_request_object) { described_class.new token_generator(1_000) }

        it 'raises an InvalidToken error' do
          expect do
            invalid_request_object.user
          end.to raise_error(ExceptionHandler::InvalidToken)
        end
      end

      context 'when expired token' do
        let(:invalid_request_object) { described_class.new expired_token_generator(user.id) }

        it 'raises an ExpiredToken error' do
          expect do
            invalid_request_object.user
          end.to raise_error(ExceptionHandler::ExpiredToken)
        end
      end
    end
  end
end

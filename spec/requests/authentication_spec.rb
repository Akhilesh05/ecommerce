# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  subject { response }

  let(:user) { create(:user) }
  let(:valid_credentials) do
    { email: user.email, password: user.password }
  end
  let(:invalid_credentials) do
    { email: user.email, password: "fake#{user.password}" }
  end

  context 'when request valid' do
    before { post authenticate_users_path, params: valid_credentials, as: :json }

    it { is_expected.to have_http_status :ok }
    it 'responds with auth_token' do
      expect(json_body[:auth_token]).not_to be_nil
    end
  end

  context 'when request invalid' do
    before { post authenticate_users_path, params: invalid_credentials, as: :json }

    it { is_expected.to have_http_status :unauthorized }
  end
end

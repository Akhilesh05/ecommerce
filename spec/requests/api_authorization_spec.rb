# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'API Authorization', type: :request do
  subject { response }

  let(:user) { create :user }

  context 'when valid request' do
    before { get user_path(user), headers: valid_auth_header }

    it { is_expected.to have_http_status :ok }
  end

  context 'when invalid request' do
    before { get user_path(user), headers: invalid_auth_header(bad_auth: true) }

    it { is_expected.to have_http_status :unauthorized }
  end
end

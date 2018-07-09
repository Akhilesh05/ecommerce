# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  subject { response }

  let(:user) { User.first }

  before { create :user }

  describe 'POST /users' do
    let(:perform_request) do
      post users_path, params: user.as_json, as: :json
    end
    let(:user) { build :user }

    it { expect { perform_request }.to change(User, :count).by(1) }
    it do
      perform_request
      is_expected.to have_http_status :created
    end
  end

  describe 'GET /users/:id' do
    before { get user_path(user), headers: valid_auth_header }

    it { is_expected.to have_http_status :ok }
    it 'responds with the user information' do
      expect(json_response[:email]).to eq user.email
    end
  end

  describe 'PATCH /users/:id' do
    let(:new_name) { Faker::Name.first_name }

    before do
      patch user_path(user),
            params: user.as_json.merge('first_name' => new_name),
            headers: valid_auth_header,
            as: :json
    end

    it { is_expected.to have_http_status :ok }
    it 'changes the first_name' do
      expect(user.reload.first_name).to eq new_name
    end
  end

  describe 'DELETE /users/:id' do
    let(:perform_request) { delete user_path(user), headers: valid_auth_header }

    it do
      perform_request
      is_expected.to be_successful # 2xx status code
    end
    it { expect { perform_request }.to change(User, :count).by(-1) }
  end
end

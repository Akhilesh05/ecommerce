# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  subject { response }

  describe 'POST /users' do
    subject(:req) do
      post users_path, params: user.as_json, as: :json
      response
    end

    let(:user) { build :user }

    it { expect { req }.to change(User, :count).by(1) }

    it { is_expected.to have_http_status :created }
  end

  describe 'GET /users/:id' do
    let(:user) { create :user }

    before { get user_path(user), headers: valid_auth_header }

    it { is_expected.to have_http_status :ok }
    it 'responds with the user information' do
      expect(json_response[:email]).to eq user.email
    end
  end

  describe 'PATCH /users/:id' do
    let(:user) { create :user }
    let(:new_name) { Faker::Name.first_name }

    before do
      patch user_path(user),
            params: user.as_json.merge(first_name: new_name),
            headers: valid_auth_header,
            as: :json
    end

    it { is_expected.to have_http_status :ok }
    it 'changes the first_name' do
      expect(user.reload.first_name).to eq new_name
    end
  end

  describe 'DELETE /users/:id' do
    before { create :user }

    let(:user) { User.first }

    it do
      expect do
        delete user_path(user), headers: valid_auth_header
      end.to change(User, :count).by(-1)
    end
  end
end

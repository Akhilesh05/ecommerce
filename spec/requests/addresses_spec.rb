# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Addresses', type: :request do
  subject { response }

  let(:user) { User.first }
  let(:addresses) { user.addresses }
  let(:num_addresses) { 5 }

  before do
    create :user
    create_list :address, num_addresses, user_id: user.id
  end

  describe 'GET /users/:id/addresses' do
    before { get user_addresses_path(user), headers: valid_auth_header }

    it { is_expected.to have_http_status :ok }
    it "consists of 5 addresses" do
      expect(json_response.length).to eq num_addresses
    end
  end

  describe 'POST /users/:id/addresses' do
    let(:perform_request) do
      post user_addresses_path(user),
           params: build(:address, user_id: user.id).as_json,
           headers: valid_auth_header,
           as: :json
    end

    it do
      perform_request
      is_expected.to have_http_status :created
    end
    it { expect { perform_request }.to change(user.addresses, :count).by(1) }
  end

  describe 'GET /user/:id/addresses/:id' do
    before { get user_address_path(user, addresses.first), headers: valid_auth_header }

    it { is_expected.to have_http_status :ok }
    it 'has the address information' do
      expect(json_response[:line1]).to eq addresses.first.line1
    end
  end
end

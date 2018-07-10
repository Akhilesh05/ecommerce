# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Addresses', type: :request do
  subject { response }

  let(:user) { User.first }
  let(:addresses) { user.addresses }
  let(:address) { addresses.first }
  let(:num_addresses) { 5 }

  before do
    create_list(:user, 2).each do |usr|
      create_list :address, num_addresses, user_id: usr.id
    end
  end

  describe 'GET /addresses' do
    before { get addresses_path, headers: valid_auth_header }

    it { is_expected.to have_http_status :ok }
    it { expect(json_response.length).to eq num_addresses }
  end

  describe 'POST /addresses' do
    let(:perform_request) do
      post addresses_path,
           params: build(:address, user_id: user.id).as_json,
           headers: valid_auth_header,
           as: :json
    end

    it { expect { perform_request }.to change(user.addresses, :count).by 1 }
    it do
      perform_request
      is_expected.to have_http_status :created
    end
  end

  describe 'GET /addresses/:id' do
    before { get address_path(address), headers: valid_auth_header }

    it { is_expected.to have_http_status :ok }
    it 'has the address information' do
      expect(json_response[:line1]).to eq address.line1
    end
  end

  describe 'PATCH /addresses/:id' do
    let(:line2) { Faker::Address.street_name }

    before do
      patch address_path(address),
            params: address.as_json.merge('line2' => line2),
            headers: valid_auth_header,
            as: :json
    end

    it { is_expected.to have_http_status :ok }
    it 'reflects new patched update' do
      expect(address.reload.line2).to eq line2
    end
  end

  describe 'DELETE /addresses/:id' do
    let(:perform_request) { delete address_path(address), headers: valid_auth_header }

    it { expect { perform_request }.to change(user.addresses, :count).by(-1) }
    it do
      perform_request
      is_expected.to be_successful # 2xx status code
    end
  end
end

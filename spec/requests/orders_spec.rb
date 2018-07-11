# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Orders', type: :request do
  subject { response }

  let(:user) { User.first }
  let(:address) { user.addresses.first }

  before do
    create_list(:user, 2).each do |usr|
      create_list(:address, 3, user_id: usr.id).each do |addr|
        create_list :order, 4, address_id: addr.id
      end
    end
  end

  describe 'GET /orders' do
    before { get orders_path, headers: valid_auth_header }

    it { is_expected.to have_http_status :ok }
    it { expect(json_response.length).to eq user.orders.count }
  end

  describe 'GET /addresses/:id/orders' do
    before { get address_orders_path(address), headers: valid_auth_header }

    it { is_expected.to have_http_status :ok }
    it { expect(json_response.length).to eq address.orders.count }
  end

  describe 'POST /addresses/:id/orders' do
    let(:perform_request) { post address_orders_path(address), headers: valid_auth_header }

    it do
      perform_request
      is_expected.to have_http_status :created
    end
    it { expect { perform_request }.to change(address.orders, :count).by 1 }
  end
end

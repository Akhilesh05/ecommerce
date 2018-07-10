# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrderLinesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/orders/1/order_lines').to route_to('order_lines#index', order_id: '1')
    end

    it 'routes to #show' do
      expect(get: '/orders/1/order_lines/1').to route_to 'order_lines#show',
                                                         order_id: '1',
                                                         id: '1'
    end

    it 'routes to #create' do
      expect(post: '/orders/1/order_lines').to route_to('order_lines#create', order_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/orders/1/order_lines/1').to route_to 'order_lines#update',
                                                         order_id: '1',
                                                         id: '1'
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/orders/1/order_lines/1').to route_to 'order_lines#update',
                                                           order_id: '1',
                                                           id: '1'
    end

    it 'routes to #destroy' do
      expect(delete: '/orders/1/order_lines/1').to route_to 'order_lines#destroy',
                                                            order_id: '1',
                                                            id: '1'
    end
  end
end

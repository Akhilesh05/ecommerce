# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PriceChangesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/products/1/price_changes')
        .to route_to('price_changes#index', product_id: '1')
    end

    it 'routes to #show' do
      expect(get: '/products/1/price_changes/1')
        .to route_to('price_changes#show', product_id: '1', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/products/1/price_changes')
        .to route_to('price_changes#create', product_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/products/1/price_changes/1')
        .to route_to('price_changes#update', product_id: '1', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/products/1/price_changes/1')
        .to route_to('price_changes#update', product_id: '1', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/products/1/price_changes/1')
        .to route_to('price_changes#destroy', product_id: '1', id: '1')
    end
  end
end

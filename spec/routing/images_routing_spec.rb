# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ImagesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/products/1/images').to(
        route_to('images#index', product_id: '1')
      )
    end

    it 'routes to #show' do
      expect(get: '/products/1/images/1').to(
        route_to('images#show', product_id: '1', id: '1')
      )
    end

    it 'routes to #create' do
      expect(post: '/products/1/images').to(
        route_to('images#create', product_id: '1')
      )
    end

    it 'routes to #update via PUT' do
      expect(put: '/products/1/images/1').to(
        route_to('images#update', product_id: '1', id: '1')
      )
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/products/1/images/1').to(
        route_to('images#update', product_id: '1', id: '1')
      )
    end

    it 'routes to #destroy' do
      expect(delete: '/products/1/images/1').to(
        route_to('images#destroy', product_id: '1', id: '1')
      )
    end
  end
end

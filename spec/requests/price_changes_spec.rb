require 'rails_helper'

RSpec.describe 'PriceChanges', type: :request do
  describe 'GET /price_changes' do
    it 'works! (now write some real specs)' do
      get price_changes_path
      expect(response).to have_http_status(200)
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Image, type: :model do
  # Associations
  it { should belong_to(:product) }
  # Validations
  it { should validate_presence_of(:url) }
  it { should allow_value('https://google.com/index.html').for(:url) }
  it { should_not allow_value('google.com/index.html').for(:url) }
end

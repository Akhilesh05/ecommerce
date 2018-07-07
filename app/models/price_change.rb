# frozen_string_literal: true

class PriceChange < ApplicationRecord
  # Associations
  belongs_to :product
  # Validations
  validates :value, presence: true
end

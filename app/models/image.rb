# frozen_string_literal: true

class Image < ApplicationRecord
  # Associations
  belongs_to :product
  # Validations
  validates :url, presence: true, format: { with: Global.validations.regexp.url }
end

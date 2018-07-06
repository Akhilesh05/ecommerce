# frozen_string_literal: true

class Brand < ApplicationRecord
  # Associations
  has_many :products, dependent: :destroy
  # Validations
  validates :name, presence: true, length: { maximum: 50 }
end

# frozen_string_literal: true

class Product < ApplicationRecord
  # Associations
  belongs_to :brand, optional: true
  has_many :price_changes, dependent: :destroy
  has_many :images, dependent: :destroy
  # Validations
  validates :name, presence: true, length: { maximum: 100 }
end

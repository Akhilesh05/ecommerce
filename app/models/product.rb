# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :brand, optional: true
  has_many :price_changes, dependent: :destroy
  has_many :images, dependent: :destroy
end

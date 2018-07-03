class Product < ApplicationRecord
  belongs_to :brand
  has_many :price_changes, dependent: :destroy
  has_many :images, dependent: :destroy
end

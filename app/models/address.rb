# frozen_string_literal: true

class Address < ApplicationRecord
  # Associations
  belongs_to :user
  # Validations
  validates :first_name, :last_name, :city, presence: true, length: { within: 2..50 }
  validates :line1, presence: true, length: { minimum: 2 }
  validates :mobile_number, presence: true, length: { is: 8 }
  validates :zip_code, length: { maximum: 20 }
  validates :country, presence: true, length: { is: 2 }
end

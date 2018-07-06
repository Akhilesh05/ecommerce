# frozen_string_literal: true

class Address < ApplicationRecord
  # Associations
  belongs_to :user
  # Validations
  validates :first_name, :last_name, :mobile_number, :line1, :city, :country, presence: true
  validates :first_name, :last_name, :city, length: { within: 2..50 }
  validates :line1, length: { minimum: 2 }
  validates :mobile_number, length: { is: 8 }
  validates :zip_code, length: { maximum: 20 }
  validates :country, length: { is: 2 }
end

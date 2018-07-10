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
  # Hooks
  before_validation :inherit_user_information,
                    unless: proc { first_name && last_name && mobile_number || user_id.nil? }

  def inherit_user_information
    self.first_name ||= user.first_name
    self.last_name ||= user.last_name
    self.mobile_number ||= user.mobile_number
  end
end

# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  # Associations
  has_many :addresses, dependent: :destroy
  # Validations
  validates :first_name, :last_name, :email, :password_digest, :mobile_number, presence: true
  validates :first_name, :last_name, length: { within: 2..50 }
  validates :mobile_number, length: { is: 8 }
  validates :email, length: { maximum: 100 }
  validates :nic_number, length: { is: 14, allow_nil: true }
  validates :passport_country_number, length: { maximum: 20 }
  validates :nationality, length: { is: 2, allow_nil: true }
  validates :email, format: { with: /.@.+\../ }
  validates :password, length: { minimum: 8, allow_nil: true }
  validates :password, format: { with: Global.fields.password_regexp, allow_nil: true }
  validates :email, uniqueness: { case_sensitive: false }
  validates :nic_number,
            :passport_country_number,
            uniqueness: { case_sensitive: false, allow_nil: true }
  # Hooks
  # Scopes

  def password_valid?(unencrypted_password)
    authenticate(unencrypted_password) == self
  end
end

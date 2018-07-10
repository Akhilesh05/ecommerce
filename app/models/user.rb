# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  # Associations
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  # Validations
  validates :password_digest, presence: true
  validates :gender, inclusion: { in: %w[m f], allow_nil: true }
  validates :first_name, :last_name, presence: true, length: { within: 2..50 }
  validates :mobile_number,
            presence: true,
            length: { is: 8 },
            format: { with: Global.validations.regexp.mobile_number }
  validates :nic_number, length: { is: 14, allow_nil: true }
  validates :passport_country_number, length: { maximum: 20 }
  validates :nationality, length: { is: 2, allow_nil: true }
  validates :email,
            presence: true,
            length: { maximum: 100 },
            uniqueness: { case_sensitive: false },
            format: { with: Global.validations.regexp.email }
  validates :password,
            length: { minimum: 8, allow_nil: true },
            format: { with: Global.validations.regexp.password,
                      allow_nil: true,
                      message: I18n.t(:password_invalid) }
  validates :nic_number,
            :passport_country_number,
            uniqueness: { case_sensitive: false, allow_nil: true }
  # Hooks
  # Scopes

  def password_valid?(unencrypted_password)
    authenticate(unencrypted_password) == self
  end

  def as_json(options = nil)
    super(options).merge('password' => password)
  end
end

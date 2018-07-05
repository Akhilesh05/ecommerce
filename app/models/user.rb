# frozen_string_literal: true

class User < ApplicationRecord
  attr_accessor :password

  # Associations
  has_many :addresses, dependent: :destroy
  # Validations
  validates :first_name, :last_name, :email, :password_digest, :mobile_number, presence: true
  validates :first_name, :last_name, length: { minimum: 2 }
  validates :mobile_number, length: { is: 8 }
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, format: /.@.+\../
  validates :nic_number,
            :passport_country_number,
            uniqueness: { case_sensitive: false, allow_nil: true }
  # Hooks
  before_validation :digest_password, if: proc { password.present? }
  # Scopes

  def digest_password
    self.password_salt = SecureRandom.uuid
    digest = Digest::SHA2.new(512)
    digest << password << password_salt
    self.password_digest = digest.hexdigest
  end

  def password_valid?(password)
    digest = Digest::SHA2.new(512)
    digest << password << password_salt
    password_digest == digest.hexdigest
  end
end

class User < ApplicationRecord
  include ActiveModel::Dirty

  has_many :addresses, dependent: :destroy
  before_save :digest_password, if: proc { @password.present? }
  attr_accessor :password

  def as_json(options = {})
    options[:except] ||= %i[password_digest password_salt]
    super(options)
  end

  def digest_password
    self.password_salt = SecureRandom.uuid
    digest = Digest::SHA512.new
    digest << @password << password_salt
    self.password_digest = digest.hexdigest
  end

  def verify_password(password)
    digest = Digest::SHA512.new
    digest << password << password_salt
    password_digest == digest.hexdigest
  end
end

class User < ApplicationRecord
  include ActiveModel::Dirty

  has_many :addresses, dependent: :destroy
  before_save :digest_password, if: proc { password.present? }
  attr_accessor :password

  def as_json(options = {})
    options[:except] ||= %i[password_digest password_salt]
    super(options)
  end

  def digest_password
    self.password_salt = SecureRandom.uuid
    digest = Digest::SHA2.new(512)
    digest << password << password_salt
    self.password_digest = digest.hexdigest
  end

  def verify_password(password)
    digest = Digest::SHA2.new(512)
    digest << password << password_salt
    password_digest == digest.hexdigest
  end
end

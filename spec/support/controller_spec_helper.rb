# frozen_string_literal: true

# spec/support/controller_spec_helper.rb
module ControllerSpecHelper
  def token_generator(user_id)
    JsonWebToken.encode user_id: user_id
  end

  def expired_token_generator(user_id)
    JsonWebToken.encode({ user_id: user_id }, 10.seconds.ago)
  end

  def valid_auth_header
    { Authorization: token_generator(user.id) }
  end

  def invalid_auth_header(bad_auth: false, expired: false)
    { Authorization: bad_auth ? send("#{'expired_' if expired}token_generator", user.id + 1) : nil }
  end
end

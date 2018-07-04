# frozen_string_literal: true

class JsonWebToken
  HMAC_SECRET = Rails.application.secrets.secret_key_base

  def self.encode(payload, expiry = 1.day.from_now)
    payload[:exp] = expiry.to_i
    JWT.encode(payload, HMAC_SECRET)
  end

  def self.decode(token)
    payload = JWT.decode(token, HMAC_SECRET)[0]
    HashWithIndifferentAccess.new payload
  rescue JWT::DecodeError => e
    raise ExceptionHandler::InvalidToken, e.message
  end
end
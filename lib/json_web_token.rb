# frozen_string_literal: true

class JsonWebToken
  HMAC_SECRET = Rails.application.credentials.secret_key_base

  def self.encode(payload, expiry = 1.day.from_now)
    payload[:exp] = expiry.to_i
    JWT.encode(payload, HMAC_SECRET)
  end

  def self.decode(token)
    payload = JWT.decode(token, HMAC_SECRET)[0]
    HashWithIndifferentAccess.new payload
  rescue JWT::ExpiredSignature => e
    raise ExceptionHandler::ExpiredToken, "expired token #{e.message}"
  rescue JWT::DecodeError => e
    raise ExceptionHandler::InvalidToken, "invalid token #{e.message}"
  end
end

# frozen_string_literal: true

class AuthorizeApiRequest
  def initialize(authorization_header)
    @authorization_header = authorization_header
  end

  def user
    @user ||= User.find(decoded_token[:user_id])
  rescue ActiveRecord::RecordNotFound => e
    raise ExceptionHandler::InvalidToken, "invalid token #{e.message}"
  end

  def decoded_token
    @decoded_token ||= JsonWebToken.decode(token)
  end

  def token
    return @token ||= @authorization_header.split(' ').last if @authorization_header.present?
    raise ExceptionHandler::MissingToken, 'missing token'
  end
end

# frozen_string_literal: true

class AuthorizeApiRequest
  def initialize(authorization_header)
    @authorization_header = authorization_header
  end

  def user
    @user ||= User.find(decoded_token[:user_id])
  rescue ActiveRecord::RecordNotFound => error
    raise ExceptionHandler::InvalidToken, "invalid token #{error.message}"
  end

  def decoded_token
    @decoded_token ||= JsonWebToken.decode(token)
  end

  def token
    raise ExceptionHandler::MissingToken, 'missing token' if @authorization_header.blank?
    @token ||= @authorization_header.split(' ').last
  end
end

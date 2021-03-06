# frozen_string_literal: true

class AuthenticateUser
  def initialize(email, password)
    if email.nil? || password.nil?
      raise ExceptionHandler::AuthenticationError, 'invalid credentials'
    end
    @email = email
    @password = password
  end

  def token
    JsonWebToken.encode(user_id: user.id)
  end

  def user
    @user ||= User.find_by(email: @email)
    return @user if @user.present? && @user.password_valid?(@password)
    raise ExceptionHandler::AuthenticationError, 'invalid credentials'
  end
end

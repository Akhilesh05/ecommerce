# frozen_string_literal: true

class AuthenticateUser
  def initialize(email, password)
    raise ExceptionHandler::AuthenticationError, 'invalid credentials' if email.nil? or password.nil?
    @email = email
    @password = password
  end

  def token
    JsonWebToken.encode(user_id: user.id)
  end

  private

  def user
    user = User.find_by(email: @email)
    return user if user.present? && user.password_valid?(@password)
    raise ExceptionHandler::AuthenticationError, 'invalid credentials'
  end
end
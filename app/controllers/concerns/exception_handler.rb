# frozen_string_literal: true

module ExceptionHandler
  extend ActiveSupport::Concern

  class AuthenticationError < StandardError; end
  class InvalidToken < StandardError; end

  included do
    rescue_from ExceptionHandler::InvalidToken, with: :four_twenty_two
    rescue_from ExceptionHandler::AuthenticationError, with: :unauthorized_request
    rescue_from CanCan::AccessDenied, with: :forbidden_request
  end

  private

  # JSON response with message; Status code 422 - unprocessable entity
  def four_twenty_two(error)
    render json: { message: error.message }, status: :unprocessable_entity
  end

  # JSON response with message; Status code 401 - Unauthorized
  def unauthorized_request(error)
    render json: { message: error.message }, status: :unauthorized
  end

  # JSON response with message; Status code 403 - Unauthorized
  def forbidden_request(error)
    render json: { message: "Forbidden, #{error.message}" }, status: :forbidden
  end
end
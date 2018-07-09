# frozen_string_literal: true

module ExceptionHandler
  extend ActiveSupport::Concern

  class AuthenticationError < StandardError; end
  class InvalidToken < StandardError; end
  class MissingToken < StandardError; end
  class ExpiredToken < StandardError; end

  included do
    rescue_from ExceptionHandler::InvalidToken, with: :four_twenty_two
    rescue_from ExceptionHandler::MissingToken, with: :four_twenty_two
    rescue_from ExceptionHandler::ExpiredToken, with: :four_twenty_two
    rescue_from ExceptionHandler::AuthenticationError, with: :unauthorized_request
    rescue_from CanCan::AccessDenied, with: :forbidden_request
    rescue_from ActiveRecord::RecordNotFound, with: :four_o_four
  end

  private

  def four_o_four(error)
    render json: { message: error.message }, status: :not_found
  end

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

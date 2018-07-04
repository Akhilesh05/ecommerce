# frozen_string_literal: true

module ExceptionHandler
  extend ActiveSupport::Concern

  class InvalidToken < StandardError; end

  rescue_from ExceptionHandler::InvalidToken, with: four_twenty_two

  def four_twenty_two(e)
    render json: { message: e.message }, status: :unprocessable_entity
  end
end
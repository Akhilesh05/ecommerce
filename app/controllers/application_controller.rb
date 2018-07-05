# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ExceptionHandler

  before_action :authorize
  attr_reader :current_user

  private

  def authorize
    auth = AuthorizeApiRequest.new(request.headers[:authorization])
    @current_user = auth.user
  end
end

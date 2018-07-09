# frozen_string_literal: true

# spec/support/request_spec_helper
module RequestSpecHelper
  # Parse JSON response to ruby hash
  def json_response
    HashWithIndifferentAccess.new JSON.parse(response.body)
  end
end

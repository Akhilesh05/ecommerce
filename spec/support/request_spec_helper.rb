# frozen_string_literal: true

# spec/support/request_spec_helper
module RequestSpecHelper
  # Parse JSON response to ruby hash
  def json_response
    { wrapper: JSON.parse(response.body) }.deep_symbolize_keys[:wrapper]
  end
end

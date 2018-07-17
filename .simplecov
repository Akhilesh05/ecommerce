# frozen_string_literal: true

require 'coveralls'

SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.start 'rails' do
  add_filter do |file|
    file.lines.count <= 6
  end
end

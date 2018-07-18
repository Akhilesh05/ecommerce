# frozen_string_literal: true

require 'coveralls'

SimpleCov.formatter = Coveralls::SimpleCov::Formatter if ENV['CI']
SimpleCov.start 'rails' do
  add_filter do |file|
    file.lines.count <= 6
  end
end

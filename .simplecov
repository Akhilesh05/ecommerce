SimpleCov.start 'rails' do
  add_filter do |file|
    file.lines.count <= 6
  end
end

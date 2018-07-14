# frozen_string_literal: true

# schedule_file = 'config/schedule.yml'
#
# if File.exist?(schedule_file) && Sidekiq.server?
#   Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
# end

Sidekiq.configure_server do
  schedule_file = 'config/schedule.yml'

  Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file) if File.exist?(schedule_file)
end

# Sidekiq.configure_client do
#   # some stuffs
# end

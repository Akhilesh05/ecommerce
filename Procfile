dev: bundle exec rails server
web: ./passenger-status-service-agent & bundle exec passenger start -p $PORT
worker: bundle exec sidekiq -t 10
release: bundle exec rails db:migrate

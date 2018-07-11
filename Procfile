web: bundle exec passenger start -p $PORT --max-pool-size 3
worker: bundle exec sidekiq -t 25
release: bundle exec rails db:migrate

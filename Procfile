dev: bundle exec rails server
web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}
#web: ./passenger-status-service-agent & bundle exec passenger start -p $PORT
worker: bundle exec sidekiq
release: bundle exec rails db:migrate

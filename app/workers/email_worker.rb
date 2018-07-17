# frozen_string_literal: true

class EmailWorker
  include Sidekiq::Worker
  sidekiq_options retry: 1 # tries once and dies
  sidekiq_retry_in { |retry_num| 60 * (retry_num + 1) - 30 * retry_num }

  def perform(user_id)
    user = User.find user_id
    UserMailer.with(user: user).welcome_email.deliver_now
  end
end

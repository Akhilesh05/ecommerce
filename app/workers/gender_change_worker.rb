# frozen_string_literal: true

class GenderChangeWorker
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find(user_id)
    user.update gender: user.gender == 'm' ? 'f' : 'm'
  end
end

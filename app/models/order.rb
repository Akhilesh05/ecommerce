# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :address
  delegate :user, to: :address # can also user has_one
end

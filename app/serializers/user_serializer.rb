# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :first_name,
    :last_name,
    :email,
    :mobile_number,
    :gender,
    :created_at,
    :updated_at
  )
  # has_many :addresses
end

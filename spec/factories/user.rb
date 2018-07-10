# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    mobile_number { Faker::Number.number(8) }
    password { "#{Faker::Internet.password(8, 10)}aA1!" }
    gender { %w[m f][rand.round] }
  end
end

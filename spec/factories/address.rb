# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    mobile_number { Faker::Number.number(8) }
    line1 { Faker::Address.street_name }
    city { Faker::Address.city }
    country { Faker::Address.country_code }
  end
end

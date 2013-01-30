# Read about factories at https://github.com/thoughtbot/factory_girl
require "faker"

FactoryGirl.define do
  factory :fan_profile do
    user
    description "{ Faker::Lorem.sentences }"
  end
end

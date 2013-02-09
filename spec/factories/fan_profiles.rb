# Read about factories at https://github.com/thoughtbot/factory_girl
require "faker"

FactoryGirl.define do
  factory :fan_profile do
    user
    description 'Test123456789'
  end

  factory :invalid_fan_profile, parent: :fan_profile do
    user
    description nil
  end
end

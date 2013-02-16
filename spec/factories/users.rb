# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 'Test User'
    email 'example@example.com'
    password 'please'
    password_confirmation 'please'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end

  factory :user_with_fan_profile, parent: :user do
    fan_profile
    name 'Test Fan'
    email 'example_fan@example.com'
    password 'please'
    password_confirmation 'please'
  end

end

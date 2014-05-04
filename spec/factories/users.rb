# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :email do |n|
    "test#{n}@example.com"
  end

  factory :user do
    name 'Test User'
    email 
    password 'please'
    password_confirmation 'please'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end

  factory :user_with_fan_profile, parent: :user do
    fan_profile
    name 'Test Fan'
    email 
    password 'please'
    password_confirmation 'please'
  end

  factory :user_with_promoter_profile, parent: :user do
    promoter_profile
    name 'Test Fan'
    email 
    password 'please'
    password_confirmation 'please'
  end

end

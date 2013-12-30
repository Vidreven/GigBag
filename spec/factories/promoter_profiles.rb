# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :promoter_profile do
  	user
    identification "1234567890"
    phone_number "012988555"
    street_address "Gigsterska 1"
  end
end

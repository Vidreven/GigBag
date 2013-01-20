FactoryGirl.define do
    factory :user do
    	sequence(:name) {|m| "Name#{m}"}
        sequence(:email) { |n| "foo#{n}@example.com" }
        password "secret"
    end
end
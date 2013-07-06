# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
  	band
    name "Testni event"
    description "See the Test band live!"
    event_date "2013-03-30"
    event_time "18:46:37"
  end

  factory :invalid_event, parent: :event do
  	band
  	description nil
  end
end

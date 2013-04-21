# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    name "Testni event"
    event_date "2013-03-30"
    event_time "18:46:37"
  end

  factory :invalid_event, parent: :event do
  	name nil
  	event_date "2013-03-30"
    event_time "18:46:37"
  end
end

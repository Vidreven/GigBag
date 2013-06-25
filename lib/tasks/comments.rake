namespace :db do
  desc "Fill database with sample comments"
  task populate: :environment do
    events = Event.all(limit: 5)
    10.times do
      content = Faker::Lorem.sentence(4)
      events.each { |event| event.comments.create!(content: content) }
    end
  end
end
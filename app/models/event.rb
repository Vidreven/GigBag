class Event < ActiveRecord::Base
  attr_accessible :event_date, :event_time, :name

  validates :name, presence: true, length: {maximum: 50}
end

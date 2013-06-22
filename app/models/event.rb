# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  event_date :date
#  event_time :time
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Event < ActiveRecord::Base
  attr_accessible :event_date, :event_time, :name, :description

  #validates :name, presence: true, length: {maximum: 50}
end

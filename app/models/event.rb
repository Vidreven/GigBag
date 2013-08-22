# == Schema Information
#
# Table name: events
#
#  id          :integer          primary key
#  name        :string(255)
#  event_date  :date
#  event_time  :time
#  created_at  :timestamp        not null
#  updated_at  :timestamp        not null
#  description :text
#

class Event < ActiveRecord::Base
  attr_accessible :event_date, :event_time, :name, :description, :status

  #validates :name, presence: true, length: {maximum: 50}
  validates :description, presence: true
  validates :status, presence: true
  has_many :comments, dependent: :destroy
  belongs_to :band
end

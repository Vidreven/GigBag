# == Schema Information
#
# Table name: bands
#
#  id         :integer          primary key
#  name       :string(255)
#  image      :string(255)
#  created_at :timestamp        not null
#  updated_at :timestamp        not null
#  website    :string(255)
#  bandcamp   :string(255)
#  facebook   :string(255)
#  lastfm     :string(255)
#  soundcloud :string(255)
#

class Band < ActiveRecord::Base
  has_and_belongs_to_many :fan_profiles
  has_many :events, dependent: :destroy
  attr_accessible :image, :name

  validates :name, :presence => true
  validates :name, :uniqueness => true
  validates :image, :url => true

  def popularity
    fan_profiles.count
  end

  def self.get_bands_list
    Band.all.map do |band|
      band.name
    end
  end

end

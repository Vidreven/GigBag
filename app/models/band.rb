# == Schema Information
#
# Table name: bands
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  image      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Band < ActiveRecord::Base
  has_many :fanships
  has_many :fan_profiles, :through => :fanships
  scope :top5,
    select("count(fanships.id) AS fanships_count").joins(:fanships).group("bands.id").order("fanships_count DESC").limit(5)

  attr_accessible :image, :name
  
  validates :name, :presence => true
  validates :image, :url => true

  def popularity
    fan_profiles.count
  end
end
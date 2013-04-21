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
  has_and_belongs_to_many :fan_profiles
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

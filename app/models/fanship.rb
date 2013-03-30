# == Schema Information
#
# Table name: fanships
#
#  id             :integer          not null, primary key
#  fan_profile_id :integer
#  band_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Fanship < ActiveRecord::Base
  attr_accessible :fan_profile_id, :band_id
  belongs_to :fan_profile
  belongs_to :band
end

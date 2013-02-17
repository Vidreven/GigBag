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

require 'spec_helper'

describe Fanship do
  pending "add some examples to (or delete) #{__FILE__}"
end

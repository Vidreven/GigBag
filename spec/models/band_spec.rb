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

require 'spec_helper'

describe Band do

  it "has a valid factory" do
    FactoryGirl.create(:band)
  end

  it "rejects bands with invalid image url" do
    FactoryGirl.build(:band, :image => "Nonurlstring").should_not be_valid
  end

  it "rejects bands with no name" do
    FactoryGirl.build(:band, :name => nil).should_not be_valid
  end
end

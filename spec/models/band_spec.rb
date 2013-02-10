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

# == Schema Information
#
# Table name: fan_profiles
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  description     :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  lastfm_username :string(255)
#

require 'spec_helper'


describe FanProfile do

  it "has a valid factory" do
    FactoryGirl.create(:fan_profile)
  end

  it "should be created by a signed in user" do
    @test_user = FactoryGirl.create(:user)
    @test_user.build_fan_profile({:description => "Test123456789"})
  end

  it "should reject profiles without description" do
    FactoryGirl.build(:fan_profile, :description => nil).should_not be_valid
  end

  it "should reject content shorter than 10 characters" do
    FactoryGirl.build(:fan_profile, :description => "Test").should_not be_valid
  end

  it "should reject content longer than 100 characters" do
    FactoryGirl.build(:fan_profile, :description => "Test1" * 20 + "a").should_not be_valid
  end

  it "should reject invalid lastfm_username" do
    FactoryGirl.build(:fan_profile, :lastfm_username => "Something Invalid").should_not be_valid
  end

  it "should accept valid lastfm_username" do
    FactoryGirl.build(:fan_profile).should be_valid
  end
end

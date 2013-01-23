require 'spec_helper'


describe FanProfile do

  before(:each) do
    @test_user = FactoryGirl.create(:user)
  end

  it "should be created by signed in user" do
    @test_user.build_fan_profile({:description => "Test123456789"})
  end

  it "should reject content shorter than 10 characters" do
    fan_profile_with_short_description = @test_user.build_fan_profile({:description => "Test"})
    fan_profile_with_short_description.should_not be_valid
  end

  it "should reject content longer than 100 characters" do
    fan_profile_with_short_description = @test_user.build_fan_profile({:description => "Test1" * 20 + "a"})
    fan_profile_with_short_description.should_not be_valid
  end
end

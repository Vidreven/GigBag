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
    @test_user.build_fan_profile({:lastfm_username => "Vunovati"})
  end

  it "should reject profiles without lastfm_username" do
    FactoryGirl.build(:invalid_fan_profile).should_not be_valid
  end

  it "should reject invalid lastfm_username" do
    FactoryGirl.build(:fan_profile, :lastfm_username => "Something Invalid").should_not be_valid
  end

  it "should accept valid lastfm_username" do
    FactoryGirl.build(:fan_profile).should be_valid
  end

  describe "after_save" do
    it "creates bands", observer: :fan_profile_observer do
      expect {
        @fan_profile = FactoryGirl.build(:fan_profile)
        @fan_profile.save!
      }.to change{ Band.all.count }.by(50)
    end
    it "creates fanships", observer: :fan_profile_observer do
      expect {
        @fan_profile = FactoryGirl.build(:fan_profile)
        @fan_profile.save!
      }.to change{ Fanship.all.count }.by(50)
    end
  end
end

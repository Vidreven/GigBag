require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "FanProfile" do
  describe "Manage Fan profile" do
    it "Creates a fan profile for users who don't have them" do
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)
      visit root_path
      expect {
        click_link 'Create your fan profile'
        fill_in "Lastfm username", with: "Vunovati"
        fill_in "Description", with: "Test description"
        click_button 'Create Profile'
      }.to change(FanProfile, :count).by(1)
      Warden.test_reset!
    end
  end

  describe "Manage Fan profile" do
    it "Enables editing for users who have fan profiles" do
      user = FactoryGirl.create(:user_with_fan_profile)
      login_as(user, :scope => :user)
      visit root_path
      expect {
        click_link 'Edit your fan profile'
        fill_in "Lastfm username", with: "Changed description"
        click_button 'Update Profile'
      }.to_not change(FanProfile, :count).by(1)
      Warden.test_reset!
    end
  end
end

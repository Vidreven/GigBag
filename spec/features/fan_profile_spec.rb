require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "FanProfile" do
  describe "Manage Fan profile" do
    it "Creates a fan profile for users who don't have them" do
      user = FactoryGirl.create(:user)
      band = FactoryGirl.create(:band)
      login_as(user, :scope => :user)
      visit root_path
      expect {
        click_link 'Create your fan profile'
        fill_in "Lastfm username", with: "Vunovati"
        fill_in "Band list", with: band.name
        click_button 'Create Fan profile'
      }.to change(FanProfile, :count).by(1)
      Warden.test_reset!
    end
  end

  describe "Manage Fan profile" do
    it "Enables editing for users who have fan profiles" do
      user = FactoryGirl.create(:user_with_fan_profile, :email => "someone.new@somewhere.com")
      fan_profile = FactoryGirl.create(:fan_profile, :lastfm_username => "Vidreven", :user_id => user.id)
      login_as(user, :scope => :user)
      visit root_path
      expect {
        click_link 'Edit your fan profile'
        fill_in "Lastfm username", with: "vidreven"
        fill_in "Band list", with: "Opeth"
        click_button 'Update Fan profile'
      }.to_not change(FanProfile, :count).by(1)
      Warden.test_reset!
    end
  end
end

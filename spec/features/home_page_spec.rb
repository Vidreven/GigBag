require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "Home page" do
  it "shows reccomendations for events to users with fan profiles" do
    user = FactoryGirl.create(:user_with_fan_profile)
    50.times do
      band = FactoryGirl.create(:random_band)
      user.fan_profile.bands << band
    end
    login_as(user, :scope => :user)
    visit root_path
    #puts page.html
    page.should have_content user.fan_profile.bands.first.name
    Warden.test_reset!
  end

  it "shows reccomendations for events to users with fan profiles" do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit root_path
    #puts page.html
    page.should have_content "Give us some info" 
    Warden.test_reset!
  end
end

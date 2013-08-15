require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "Bands" do
  describe "Manage bands" do

    it "Adds a new band and displays the results" do
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)
      visit bands_url
      expect{
        click_link 'New Band'
        fill_in 'band_name', with: "Example"
        fill_in 'band_image', with: "http://userserve-ak.last.fm/serve/500/29534991/Opeth+4.jpg"
        click_button "Create Band"
      }.to change(Band,:count).by(1)
      within 'h2' do
        page.should have_content "Example"
      end
      Warden.test_reset!
    end

    it "Deletes a band" do
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)
      band = FactoryGirl.create(:band)
      visit bands_path
      expect{
        within "#band_#{band.id}" do
          click_link 'Remove'
        end
      }.to change(Band,:count).by(-1)
      page.should have_content "Bands"
      page.should_not have_content band.name
      Warden.test_reset!
    end
  end
end

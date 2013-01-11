require 'spec_helper'

describe "Logins" do
  it "log in valid users" do
  	user = FactoryGirl.create(:user)
  	visit login_path
  	fill_in "Email", :with => user.email
  	fill_in "Password", :with => user.password
  	click_button "Log in"
  	page.should have_content("successfully")
  end
end

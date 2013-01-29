require 'spec_helper'

describe FanProfileController do

  # describe "FAN_PROFILE 'create'" do
  #   before(:each) do
  #     @user = test_sign_in(Factory(:user))
  #   end
  # end

  describe "GET 'index'" do

    before (:each) do
      @user = FactoryGirl.create(:user)
      sign_in @user
    end
  
    it "should show FAN_PROFILES to signed in users" do
      get :index
      response.should be_success
    end

    it "should show each FAN_PROFILE individually" do
      
      get :show, :id => 1
      response.should be_success      
    end

  end

end

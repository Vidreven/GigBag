require 'spec_helper'

describe PromoterProfile do
  
   it "has a valid factory" do
    FactoryGirl.create(:promoter_profile)
  end

  it "should be created by a signed in user" do
    @test_user = FactoryGirl.create(:user)
    @test_user.build_promoter_profile({identification: "1234567890", phone_number: "012988555", 
    	street_address: "Gigsterska 1"})
  end

end

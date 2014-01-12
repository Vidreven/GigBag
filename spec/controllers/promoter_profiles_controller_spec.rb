require 'spec_helper'

describe PromoterProfilesController do
	describe "GET 'show'" do
		it "assigns the requested contact to @promoter_profile" do
      		promoter_profile = FactoryGirl.create(:promoter_profile)
      		get :show, :user_id => promoter_profile.user_id, :id => promoter_profile.id
      		assigns(:promoter_profile).should eq(promoter_profile)
    	end


    	it "renders the :show template" do
      		promoter_profile = FactoryGirl.create(:promoter_profile)
      		get :show, :user_id => promoter_profile.user_id, :id => promoter_profile.id
      		response.should render_template :show
    	end
	end

	describe "POST 'create'" do
		def login_user
      		@request.env["devise.mapping"] = Devise.mappings[:user]
      		@user = FactoryGirl.create(:user)
      		sign_in @user
    	end

    	context "with valid attributes" do
    		it "saves the new promoter profile to database" do
        		login_user
        		expect{
          			post :create, :user_id => @user, :promoter_profile => FactoryGirl.attributes_for(:promoter_profile)
        		}.to change(PromoterProfile, :count).by(1)
        		sign_out @user
      		end
    	end
	end
end
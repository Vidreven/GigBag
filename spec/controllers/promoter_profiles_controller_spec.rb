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

	describe "PUT update" do
		def login_user
      		@request.env["devise.mapping"] = Devise.mappings[:user]
      		@user = FactoryGirl.create(:user)
      		sign_in @user
    	end

    	before :each do
      		login_user
      		@promoter_profile = FactoryGirl.create(:promoter_profile, user: @user)
    	end

    	context "valid attributes" do
    		it "located the requested promoter_profile" do
        		put :update, user_id: @promoter_profile, :promoter_profile => FactoryGirl.attributes_for(:promoter_profile)
        		assigns(:promoter_profile).should eq(@promoter_profile)
        		sign_out @user
      		end

      		it "redirects to the updated promoter_profile" do
        		put :update, user_id: @promoter_profile, :promoter_profile => FactoryGirl.attributes_for(:promoter_profile)
        		response.should redirect_to @promoter_profile.user
      		end
    	end

    	context "invalid attributes" do
      		it "locates the requested promoter_profile" do
        		put :update, user_id: @promoter_profile, :promoter_profile => FactoryGirl.attributes_for(:invalid_promoter_profile)
        		assigns(:promoter_profile).should eq(@promoter_profile)
      		end
    	end
	end

	describe 'DELETE destroy' do
    	def login_user
      		@request.env["devise.mapping"] = Devise.mappings[:user]
      		@user = FactoryGirl.create(:user)
      		sign_in @user
    	end

    	before :each do
      		login_user
      		@promoter_profile = FactoryGirl.create(:promoter_profile, user: @user)
    	end

    	it "deletes the promoter_profile" do
      		expect{
        		delete :destroy, user_id: @promoter_profile, id: @promoter_profile
      		}.to change(PromoterProfile, :count).by(-1)
    	end
  	end
end
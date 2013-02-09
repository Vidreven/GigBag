require 'spec_helper'

describe FanProfilesController do

  describe "GET 'show'" do
    it "assigns the requested contact to @fan_profile" do
      fan_profile = FactoryGirl.create(:fan_profile)
      get :show, :user_id => fan_profile.user_id, :id => fan_profile.id
      assigns(:fan_profile).should eq(fan_profile)
    end

    it "renders the :show template" do
      fan_profile = FactoryGirl.create(:fan_profile)
      get :show, :user_id => fan_profile.user_id, :id => fan_profile.id
      response.should render_template :show
    end
  end

  describe "GET 'new'" do
    it "assigns a new Fan Profile to @fan_profile"
    it "renders the :new template"
  end

  describe "POST 'create" do

    def login_user
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = FactoryGirl.create(:user)
      sign_in @user
    end

    context "with valid attributes" do
      it "saves the new fan Profile to database" do
        login_user
        expect{
          post :create, :user_id => @user, :fan_profile => FactoryGirl.attributes_for(:fan_profile)
        }.to change(FanProfile, :count).by(1)
        sign_out @user
      end

      it "redirects to user page" do
        login_user
        post :create, :user_id => @user, :fan_profile => FactoryGirl.attributes_for(:fan_profile)
        response.should redirect_to @user
      end
    end

    context "with invalid attributes" do
      it "does not save a fan Profile to database" do
        login_user
        expect{
          post :create, :user_id => @user, :fan_profile => FactoryGirl.attributes_for(:invalid_fan_profile)
        }.to_not change(FanProfile, :count)
        sign_out @user
      end
      it "renders the :new template again" do
        login_user
        post :create, :user_id => @user, :fan_profile => FactoryGirl.attributes_for(:invalid_fan_profile)
        response.should render_template :new
      end
    end

    context "unauthorized user" do
      it "cannot create a profile" do
        @user = FactoryGirl.create(:user)
        expect{
          post :create, :user_id => @user, :fan_profile => FactoryGirl.attributes_for(:invalid_fan_profile)
        }.to_not change(FanProfile, :count)
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
      @fan_profile = FactoryGirl.create(:fan_profile, user: @user)
    end

    context "valid attributes" do
      it "located the requested fan_profile" do
        put :update, user_id: @fan_profile, :fan_profile => FactoryGirl.attributes_for(:fan_profile)
        assigns(:fan_profile).should eq(@fan_profile)
        sign_out @user
      end

      it "changes @fan_profile attributes" do
        put :update, user_id: @fan_profile,
          :fan_profile => FactoryGirl.attributes_for(:fan_profile, description: "Changed description")
        @fan_profile.reload
        @fan_profile.description.should eq("Changed description")
      end

      it "redirects to the updated fan_profile" do
        put :update, user_id: @fan_profile, :fan_profile => FactoryGirl.attributes_for(:fan_profile)
        response.should redirect_to @fan_profile.user
      end
    end

    context "invalid attributes" do
      it "locates the requested fan_profile" do
        put :update, user_id: @fan_profile, :fan_profile => FactoryGirl.attributes_for(:invalid_fan_profile)
        assigns(:fan_profile).should eq(@fan_profile)
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
      @fan_profile = FactoryGirl.create(:fan_profile, user: @user)
    end

    it "deletes the fan_profile" do
      expect{
        delete :destroy, user_id: @fan_profile, id: @fan_profile
      }.to change(FanProfile, :count).by(-1)
    end
  end

end

require 'spec_helper'

describe BandsController do

  describe "GET #index" do
    it "populates an array of bands" do
      band = FactoryGirl.create(:band)
      get :index
      assigns(:bands).should eq([band])
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET 'show'" do
    it "assigns the requested band to @band" do
      band = FactoryGirl.create(:band)
      get :show, id: band
      assigns(:band).should eq(band)
    end

    it "renders the :show template" do
      band = FactoryGirl.create(:band)
      get :show, id: band
      response.should render_template :show
    end
  end

  describe "POST 'create'" do
    def login_user
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = FactoryGirl.create(:user)
      sign_in @user
    end

    context "valid attributes" do
      it "saves the new band to database" do
        login_user
        expect{
          post :create, band: FactoryGirl.attributes_for(:band)
        }.to change(Band, :count).by(1)
        sign_out @user
      end

      it "redirects to band page" do
        login_user
        post :create, band: FactoryGirl.attributes_for(:band)
        response.should redirect_to Band.last
        sign_out @user
      end
    end

    context "invalid attributes" do
      it "does not save invalid band to db" do
        login_user
        expect{
          post :create, band: FactoryGirl.attributes_for(:invalid_band)
        }.to_not change(Band, :count)
        sign_out @user
      end

      it "renders the :new template again" do
        login_user
        post :create, band: FactoryGirl.attributes_for(:invalid_band)
        response.should render_template :new
      end
    end

    context "unauthorized user" do
      it "cannot create a band" do
        @band = FactoryGirl.create(:band)
        expect{
          post :create, band: FactoryGirl.attributes_for(:band)
        }.to_not change(Band, :count)
      end
      it "redirects to sign in page" do
        post :create, band: FactoryGirl.attributes_for(:band)
        response.should redirect_to new_user_session_path
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
      @band = FactoryGirl.create(:band)
    end

    context "valid attributes" do
      it "located the requested band" do
        login_user
        put :update, id: @band, band: FactoryGirl.attributes_for(:band)
        assigns(:band).should eq(@band)
        sign_out @user
      end

      it "changes @band attributes" do
        login_user
        put :update, id: @band, band: FactoryGirl.attributes_for(:band, :name => "Changed name")
        @band.reload
        @band.name.should eq("Changed name")
        sign_out @user
      end

      it "redirects to the updated band" do
        login_user
        put :update, id: @band, band: FactoryGirl.attributes_for(:band, :name => "Changed name")
        @band.reload
        response.should redirect_to @band
        sign_out @user
      end
    end

    context "invalid attributes" do
      it "locates the requested band" do
        login_user
        put :update, id: @band, band: FactoryGirl.attributes_for(:invalid_band)
        assigns(:band).should eq(@band)
        sign_out @user
      end

      it "does not change @band's attributes" do
        login_user
        put :update, id: @band,
          band: FactoryGirl.attributes_for(:band, image: "Edited")
        @band.reload
        @band.image.should_not eq("Edited")
      end

      it "re-renders the edit method" do
        login_user
        put :update, id: @band, band: FactoryGirl.attributes_for(:invalid_band)
        response.should render_template :edit
      end
    end

    context "unauthorized user" do
      it "does not edit band" do
        put :update, id: @band,
          band: FactoryGirl.attributes_for(:band, name: "Edited")
        @band.reload
        @band.name.should_not eq("Edited")
      end
    end

    describe 'DELETE destroy' do
      def login_user
        @request.env["devise.mapping"] = Devise.mappings[:user]
        @user = FactoryGirl.create(:user)
        sign_in @user
      end

      context "authorized user" do

        before :each do
          @band = FactoryGirl.create(:random_band)
          login_user
        end

        it "deletes the band" do
          expect{
            delete :destroy, id: @band
          }.to change(Band,:count).by(-1)
        end

        it "redirects to bands#index" do
          delete :destroy, id: @band
          response.should redirect_to bands_url
        end
      end
    end
  end

end

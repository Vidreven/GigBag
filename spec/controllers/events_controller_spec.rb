require 'spec_helper'

describe EventsController do

  def login_user
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = FactoryGirl.create :user
    sign_in @user
  end

	let(:event) {FactoryGirl.create :event}
  let(:band) {FactoryGirl.create :band}

	describe "GET index" do
		it "lists all events" do
      event = FactoryGirl.create :event
			get :index
			expect(assigns :events).to eq([event])
		end

		it "renders the :index view" do
			get :index
      response.should render_template :index
		end
	end

	describe "GET show" do
		it "should show an event" do
			get :show, id: event
			expect(assigns :event).to eq(event)
		end

		it "renders the :show template" do
      get :show, id: event
    	response.should render_template :show
    end
	end

	describe "POST 'create'" do

    context "valid attributes" do
     		# it "saves the new event to database" do
       # 		login_user
       # 		expect{
       #   			#post :create, :band_id => band, event: FactoryGirl.attributes_for(:event)
       #        post :create, event: FactoryGirl.attributes_for(:event)
       # 		}.to change(Event, :count).by(1)
       # 		sign_out @user
     		# end

     		# it "redirects to event page" do
       # 		login_user
       # 		post :create, event: FactoryGirl.attributes_for(:event)
       # 		response.should redirect_to Event.last
       # 		sign_out @user
     		# end
    end

    context "invalid attributes" do
     		# it "does not save invalid event to db" do
       # 		login_user
       # 		expect{
       #   		post :create, event: FactoryGirl.attributes_for(:invalid_event)
       # 		}.to_not change(Event, :count)
       # 		sign_out @user
     		# end

     		# it "renders the :new template again" do
       # 		login_user
       # 		post :create, event: FactoryGirl.attributes_for(:invalid_event)
       # 		response.should render_template :new
     		# end
    end

     context "unauthorized user" do
       it "cannot create an event" do
         expect{
           post :create, band_id: band, event: FactoryGirl.attributes_for(:event)
         }.to_not change(Event, :count)
       end
       it "redirects to sign in page" do
         post :create, event: FactoryGirl.attributes_for(:event)
         expect(response).to redirect_to new_user_session_path
       end
     end
	end

  describe "PUT update" do
    
    context "valid attributes" do
      it "located the requested event" do
        login_user
        put :update, id: event.id, event: FactoryGirl.attributes_for(:event)
        expect(assigns :event).to eq(event)
        sign_out @user
      end

      it "changes event attributes" do
        login_user
        put :update, id: event.id, event: FactoryGirl.attributes_for(:event, :name => "Changed name")
        event.reload
        expect(event.name).to eq("Changed name")
        sign_out @user
      end

      it "redirects to the updated event" do
        login_user
        put :update, id: event, event: FactoryGirl.attributes_for(:event, :name => "Changed name")
        event.reload
        expect(response).to redirect_to event
        sign_out @user
      end
    end

    context "invalid attributes" do
      it "does not change event attributes" do
        login_user
        put :update, id: event, event: FactoryGirl.attributes_for(:event, :description => "")
        event.reload
        expect(event.description).not_to eq("")
      end

      it "re-renders the edit method" do
        login_user
        put :update, id: event, event: FactoryGirl.attributes_for(:invalid_event)
        expect(response).to render_template :edit
      end
    end

    context "unauthorized user" do
      it "does not edit event" do
        put :update, id: event, event: FactoryGirl.attributes_for(:event, name: "Edited")
        event.reload
        expect(event.name).not_to eq("Edited")
      end
    end
  end

  describe "DELETE destroy" do

    context "authorised user" do
      it "deletes the event" do
        login_user
        event = FactoryGirl.create :event
        expect{
          delete :destroy, id: event
        }.to change(Event, :count).by(-1)
      end

      it "redirects to event#index" do
        login_user
        delete :destroy, id: event
        expect(response).to redirect_to events_url
      end
    end
  end
end
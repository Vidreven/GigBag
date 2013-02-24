require 'spec_helper'

describe HomeController do

  describe "GET index" do
    it "shows list of events with most popular_bands" do
      bands = 50.times do FactoryGirl.create(:random_band) end
      get :index
      response.should be_success
    end
  end

end

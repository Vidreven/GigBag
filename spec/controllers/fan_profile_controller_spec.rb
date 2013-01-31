require 'spec_helper'

describe FanProfileController do

  describe "GET 'index'" do
    it "populates an array of fan profiles" 
    it "renders the :index view"
  end

  describe "GET 'show'" do
    it "assigns the requested contact to @contact" 
    it "renders the :show template"
  end

  describe "GET 'new'" do
    it "assigns a new Fan Profile to @fan_profile"
    it "renders the :new template"
  end

  describe "POST 'create" do
    context "with valid attributes" do
      it "saves the new fan Profile to database"
      it "redirects to home page"
    end

    context "with invalid attributes" do
      it "does not save a fan Profile to database"
      it "renders the :new template again"
    end
  end

end

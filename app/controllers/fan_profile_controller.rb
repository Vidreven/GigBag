class FanProfileController < ApplicationController
  def create
    @fan_profile = current_user.create_fan_profile(params[:description])
    if @fan_profile.save
      flash[:success] = "Successfully created profile"
    end
  end

  def index
    @profiles = FanProfile.all
  end
end

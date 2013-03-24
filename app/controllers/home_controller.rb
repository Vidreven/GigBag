class HomeController < ApplicationController

  def index
    @users = User.all
    reccomend_events @user if user_signed_in?
  end

  def reccomend_events(user)
    if current_user.fan_profile_created?
      bands = current_user.fan_profile.bands
      @popular_bands = bands.sort_by {|b| -b.popularity}.first 5
    end
  end

end

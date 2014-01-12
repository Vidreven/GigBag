class PromoterProfilesController < ApplicationController

  def new
  	@user = User.find(params[:user_id])
    @promoter_profile = PromoterProfile.new
  end

  def show
    @user = User.find(params[:user_id])
    @promoter_profile = @user.promoter_profile
  end

  def create
  	@user = current_user
  	@promoter_profile = @user.build_promoter_profile(params[:promoter_profile])
  	if @promoter_profile.save
      flash[:success] = t 'promoter_profile_created'
      @user.promoter_profile = @promoter_profile
      redirect_to @user
    else
      flash[:error] = @promoter_profile.errors.full_messages.to_sentence
      render :new
    end
  end
end

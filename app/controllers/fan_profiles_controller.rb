class FanProfilesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]

  def create
    @user = current_user 
    @fan_profile = @user.build_fan_profile(params[:fan_profile])
    if @fan_profile.save
      flash[:success] = "Successfully created profile"
      redirect_to @user
    else
      flash[:error] = "Unable to create profile"
      render :new
    end
  end

  def show
    @user = User.find(params[:user_id])
    @fan_profile = @user.fan_profile
  end

  def edit
    @title = "Edit profile"
  end

  def update
    @user = User.find(params[:user_id])
    @fan_profile = @user.fan_profile
    @fan_profile.update_attributes(params[:fan_profile])
    if @fan_profile.save
      flash[:success] = "Successfully updated profile"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @user.fan_profile.destroy
    redirect_to @user
  end
end

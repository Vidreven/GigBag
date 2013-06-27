class BandsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]

  def index
    @query = Band.search(params[:q])
    @bands = @query.result(:distinct => true).page(params[:page]).per(15)
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(params[:band])
    if @band.save
      if current_user.fan_profile_created?
        current_user.fan_profile.bands << @band
      else
        flash[:success] = t 'need_fan_profile' #"You need to have a fan profile to become a fan of this band"
      end
      flash[:success] = t 'band_created' #"Successfully created a band"
      redirect_to @band
    else
      flash[:error] = t 'band_not_created' #"Unable to create band"
      render :new
    end
  end

  def show
    @band = Band.find(params[:id])
  end

  def update
    @band = Band.find(params[:id])
    @band.update_attributes(params[:band])
    if @band.save
      flash[:success] = t 'band_updated' #"Successfully updated band"
      redirect_to @band
    else
      render :edit
    end
  end

  def edit
    @title = t 'edit_band'
    @band = Band.find(params[:id])
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy
    redirect_to bands_url
  end
end

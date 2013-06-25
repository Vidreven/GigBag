class EventsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  
  def index
  	@events = Event.all
  end

  def show
  	@event = Event.find(params[:id])
    @comments = @event.comments.paginate(page: params[:page])
  end

  def new
    @event = Event.new
  end

  def create
  	@event = Event.new(params[:event])

  	if @event.save
  		flash[:success] = t 'event_created'
  		redirect_to @event
  	else
  		flash[:error] = t 'event_not_created'
  		render :new
  	end
  end

  def update
    @event = Event.find(params[:id])
    @event.update_attributes(params[:event])
    if @event.save
      flash[:success] = t 'event_updated'
      redirect_to @event
    else
      render :edit
    end
  end

  def edit
    @title = t 'edit_event'
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_url
  end
end

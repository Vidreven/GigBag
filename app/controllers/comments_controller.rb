class CommentsController < ApplicationController
	before_filter :authenticate_user!

	def create
		@event = Event.find(params[:event][:id])
		@comment = @event.comments.build(params[:comment])
		if @comment.save
			current_user.comments << @comment
		else
			flash[:error] = t 'comment_error'
		end
		redirect_to event_path(params[:event])
	end

	def destroy
	end
end
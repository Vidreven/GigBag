module EventsHelper
	def comment_author(id)
		User.find(id).name
	end

	def get_event_promoter_id(id)
		Event.find(id).promoter_profile_id
	end
end

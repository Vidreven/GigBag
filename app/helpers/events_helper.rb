module EventsHelper
	def comment_author(id)
		User.find(id).name
	end
end

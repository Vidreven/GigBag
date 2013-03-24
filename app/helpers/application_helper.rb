module ApplicationHelper
	def tab_item(name, url)
    opts = {}
    opts[:class] = 'active' if current_page?(url)
    content_tag :dd, opts do
      link_to name, url
    end
  end
end

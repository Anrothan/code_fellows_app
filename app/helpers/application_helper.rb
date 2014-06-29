module ApplicationHelper

	def full_title(page_title)
		base_name = "Code Fellows App"

		if page_title.empty?
			return base_name
		else 
			return "#{base_name} | #{page_title}"
		end
	end
end

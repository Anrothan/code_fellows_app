module ApplicationHelper

	def full_title(page_title)
		base_name = "Code Fellows App"

		if page_title.empty?
			return base_name
		else 
			return "#{base_name} | #{page_title}"
		end
	end

	# In reality, this would be different for each user and stored
	# as part of their profile information. This is not necessary
	# for the current implementation.
	def profile_picture
		image_tag("ruby.svg.png", alt: "Profile Picture")
	end
end

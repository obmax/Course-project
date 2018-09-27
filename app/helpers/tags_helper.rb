module TagsHelper
	def manuals_for_tags(manual)
		if manual.empty? 
			"<h2>No manuals with this tag</h2>".html_safe
		else 
			render manual
		end 
	end
end
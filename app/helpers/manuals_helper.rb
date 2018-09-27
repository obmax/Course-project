module ManualsHelper

	def category_show(manual)
		if manual.category.present?
			link_to manual.category.name, manual.category, class: "badge badge-info" 
		end 
	end

end
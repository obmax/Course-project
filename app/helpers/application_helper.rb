module ApplicationHelper
	class HTMLwithPygment < Redcarpet::Render::HTML
		def block_code(code,language)
			Pygments.highlight(code, lexer: language)
		end
	end

	def bootstrap_class_for(name)
		{
			success: "alert-success",
			error: "alert-danger",
			danger: "alert-danger",
			alert: "alert-warnint",
			notice: "alert-info"
		}[name.to_sym] || name
	end

	def tag_cloud(tags, classes)
		max = tags.sort_by(&:count).last
		tags.each do |tag|
			index = tag.count.to_f / max.count * (classes.size-1)
			yield(tag, classes[index.round])
		end
	end

	def category_menu
		categories = Category.all
		categories.each do |category|
			yield(category)
		end
	end

	def markdown(content)
		renderer = HTMLwithPygment.new(hard_wrap: true, filter_html: true)
		options = {
			autolink: true,
			no_intra_emphasis: true,
			disable_indented_code_blocks: true,
			fenced_code_blocks: true,
			lax_html_blocks: true,
			strikethrough: true,
			superscript: true
		}
		Redcarpet::Markdown.new(renderer, options).render(content).html_safe
	end
end

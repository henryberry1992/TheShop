module ApplicationHelper
	def full_title(page_title = "")
		base_title = "Lili's jewellery shop"
		if page_title.empty?
			base_title
		else
			page_title + " | " + base_title
		end
	end

	def hidden_div_if(condition, attributes = {}, &block)
		if condition
			attributes["style"] = "display :none"
		end
		content_tag("div", attributes, &block)
	end
end

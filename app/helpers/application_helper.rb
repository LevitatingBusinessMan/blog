require 'redcarpet'

class CustomHTMLRenderer < Redcarpet::Render::HTML
	def header(text, header_level)
		anchor = text.downcase.gsub(/\s+/, '-')
		"<h#{header_level} id=#{anchor} class=\"header\">#{text}<a class=\"anchor\" href=\"##{anchor}\">📎</a></h#{header_level}>"
	end
end

module ApplicationHelper
	@@redcarpet = Redcarpet::Markdown.new(
		CustomHTMLRenderer.new(
			#hard_wrap: true,
			with_toc_data: true,
		),
		fenced_code_blocks: true,
		quote: true,
		footnotes: true,
		lax_spacing: true,
		superscript: true,
		highlight: true,
		strikethrough: true,
		underline: true,
		autolink: false,
		disable_indented_code_blocks: true,
		no_intra_emphasis: true,
		space_after_headers: true,
	)
	def markdown(source)
		@@redcarpet.render(source)
	end
end
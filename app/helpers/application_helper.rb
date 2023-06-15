require 'redcarpet'

module ApplicationHelper
	@@redcarpet = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
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
	)
	def markdown(source)
		@@redcarpet.render(source)
	end
end

require 'redcarpet'

module ApplicationHelper
	@@redcarpet = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
	def markdown(source)
		@@redcarpet.render(source)
	end
end

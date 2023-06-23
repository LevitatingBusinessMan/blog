class Article < ApplicationRecord
	validates :title, presence: true
	validates :body, presence: true
	validates :visible, presence: true, allow_blank: true

	# Strip all tags from the title
	def title_stripped
		title.gsub(/<\w+>/,"").strip
	end

end

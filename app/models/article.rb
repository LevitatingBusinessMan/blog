class Article < ApplicationRecord
	validates :title, presence: true
	validates :body, presence: true
	validates :visibility, presence: true, allow_blank: true
end

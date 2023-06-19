class Article < ApplicationRecord
	validates :title, presence: true
	validates :body, presence: true
	validates :visible, presence: true, allow_blank: true
end

class Tag < ApplicationRecord

	has_many :websites

	validates :title, presence: true

	def self.search(search)
		if search.present?
			@tags = Tag.where("title LIKE (?)", "%#{search}%")
		else
			@tags = Tag.all
		end
	end
end

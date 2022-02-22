class Website < ApplicationRecord


	validates :title, presence: true
	validates :url, presence: true

	def self.search(search)
		if search.present?
			@websites = Website.where("title LIKE (?)", "%#{search}%")
			else
			@websites = Website.all
		end
	end

end

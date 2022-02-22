class Website < ApplicationRecord

	has_and_belongs_to_many :tags

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

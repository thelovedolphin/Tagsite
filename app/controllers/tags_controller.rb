class TagsController < ApplicationController

	def new
		@tags = Tag.all
		@tag = Tag.new
	end

	def create
		@tag = Tag.new(tag_params)
	end

	private
		def tag_params
			params.require(:tags).permit(:title)
		end
end

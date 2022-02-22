class TagsController < ApplicationController

	def new
		@tags = Tag.order(:title)
	end

	def create
		@tag = Tag.new(tag_params)

		redirect_to new_tag_path
	end

	def destroy
		@tag.destroy

		redirect_to new_tag_path
	end

	private
		def tag_params
			params.permit(:title)
		end
end

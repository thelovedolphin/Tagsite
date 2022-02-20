class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
  end

  private
    def tag_params
      params.require(:tag).permit(:title)
    end
end

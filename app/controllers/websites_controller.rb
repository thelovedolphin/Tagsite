class WebsitesController < ApplicationController
  def index
	@websites = Website.order('title ASC')
  end

  def new
    @website = Website.new
  end

  def create
    @website = Website.new(website_params)

    if @website.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @website = Website.find(params[:id])
  end

  def update
    @website = Website.find(params[:id])

    if @website.update(website_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @website = Website.find(params[:id])
    @website.destroy

    redirect_to root_path, status: see_other
  end

  private
	def website_params
		params.require(:website).permit(:title, :url)
	end
end

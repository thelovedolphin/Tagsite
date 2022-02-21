class WebsitesController < ApplicationController

  http_basic_authenticate_with name: "admin", password: "fegiy1-raknef-xempY", except: [:index]
  
  def index
    @websites = Website.search(params[:search])
  end

  def admin
    @websites = Website.search(params[:search])
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

    redirect_to root_path, status: :see_other
  end

  private
	def website_params
		params.require(:website).permit(:title, :url, :search)
	end
end

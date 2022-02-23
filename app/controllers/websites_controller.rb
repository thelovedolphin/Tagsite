class WebsitesController < ApplicationController

    http_basic_authenticate_with name: "admin", password: "fegiy1-raknef-xempY", except: [:index]
  
    def index
        if params[:reload_page]
            redirect_to root_path
        else
            @websites = Website.search(params[:search])
            @tags = Tag.search(params[:search])
        end
    end

    def admin
        if params[:reload_page]
            redirect_to website_admin_path
        else
            @websites = Website.search(params[:search])
            @tags = Tag.search(params[:search])
        end
    end

    def new
        @website = Website.new
        @tags = Tag.search(params[:search])
    end

    def create
        @website = Website.new(website_params)

        if @website.save
            redirect_to website_admin_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        if params[:reload_page]
            redirect_to edit_website_path
        else
            @website = Website.find(params[:id])
            @website_tag_1 = @website.tags.first
            @tags = Tag.search(params[:search])
        end
    end

    def update
        @website = Website.find(params[:id])

        if @website.update(website_params)
            redirect_to website_admin_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @website = Website.find(params[:id])
        @website.destroy
        redirect_to website_admin_path, status: :see_other
    end

    private
	    def website_params
		    params.require(:website).permit(:title, :url, :search)
	    end
end

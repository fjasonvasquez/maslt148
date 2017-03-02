class WebsitesController < ApplicationController
	def index
		@website_items = Website.all
	end

	def new
		@website_item = Website.new
	end

	def create
    @website_item = Website.new(params.require(:website_item).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @website_item.save
        format.html { redirect_to websites_path, notice: 'Your website item is now live.' }
      else
        format.html { render :new }
      end
    end
  end

end

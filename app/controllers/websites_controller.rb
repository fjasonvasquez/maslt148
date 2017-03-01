class WebsitesController < ApplicationController
	def index
		@website_items = Website.all
	end
end

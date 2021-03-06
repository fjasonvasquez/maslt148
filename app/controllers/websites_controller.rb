class WebsitesController < ApplicationController
  before_action :set_website_item, only: [:edit, :update, :show, :destroy]
  layout 'website'
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit, :sort]}, site_admin: :all
  
	def index
		@website_items = Website.by_position
	end

  def sort
    params[:order].each do |key, value|
      Website.find(value[:id]).update(position: value[:position])
  end

    render nothing: true
  end

  def angular
    @angular_website_items = Website.angular
  end

	def new
		@website_item = Website.new
	end

	def create
    @website_item = Website.new(website_params)

    respond_to do |format|
      if @website_item.save
        format.html { redirect_to websites_path, notice: 'Your website item is now live.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @website_item.update(website_params)
        format.html { redirect_to websites_path, notice: 'The record was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
  end

  def destroy

  	# Destroy/delete the record
  	@website_item.destroy

  	# Redirect
    respond_to do |format|
      format.html { redirect_to websites_url, notice: 'Record was removed.' }
    end
  end

  private

  def website_params
    params.require(:website).permit(:title, 
                                    :subtitle, 
                                    :body,
                                    :main_image,
                                    :thumb_image,
                                    partners_attributes: [:id, :name, :_destroy]
                                    )
  end

  def set_website_item
    @website_item = Website.find(params[:id])
  end
end

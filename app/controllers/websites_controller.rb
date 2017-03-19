class WebsitesController < ApplicationController
  layout 'website'
  
	def index
		@website_items = Website.all
	end

  def angular
    @angular_website_items = Website.angular
  end

	def new
		@website_item = Website.new
    3.times { @website_item.partners.build }
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
  	@website_item = Website.find(params[:id])
  end

  def update
  	@website_item = Website.find(params[:id])

    respond_to do |format|
      if @website_item.update(website_params)
        format.html { redirect_to websites_path, notice: 'The record was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
  	@website_item = Website.find(params[:id])
  end

  def destroy
  	# Perform the lookup
  	@website_item = Website.find(params[:id])

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
                                    partners_attributes: [:name]
                                    )
  end

end

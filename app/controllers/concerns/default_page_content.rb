module DefaultPageContent
	extend ActiveSupport::Concern

	included do
		before_filter :set_page_defaults
	end

  def set_page_defaults
  	@page_title = "Martine Travel Website"
  	@seo_keywords = "MA Travel"
  end
end
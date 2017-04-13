class Website < ApplicationRecord
	has_many :partners
	accepts_nested_attributes_for :partners,
																allow_destroy: true,
																reject_if: lambda { |attrs| attrs['name'].blank? }

	validates_presence_of :title, :body

	mount_uploader :thumb_image, WebsiteUploader
	mount_uploader :main_image, WebsiteUploader

	def self.angular
		where(subtitle: 'Angular')
	end

	def self.by_position
		order("position ASC")
	end

	scope :ruby_on_rails_website_items, -> { where(subtitle: 'Ruby on Rails') }
end

# def set_defaults
#		if self.main_image == nil
#			self.main_image = "http://placehold.it/600x400"
# end

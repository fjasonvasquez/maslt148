class Website < ApplicationRecord
	has_many :partners
	accepts_nested_attributes_for :partners,
																reject_if: lambda { |attrs| attrs['name'].blank? }

	include Placeholder
	validates_presence_of :title, :body, :main_image, :thumb_image

	mount_uploader :thumb_image, WebsiteUploader
	mount_uploader :main_image, WebsiteUploader

	def self.angular
		where(subtitle: 'Angular')
	end

	def self.by_position
		order("position ASC")
	end

	scope :ruby_on_rails_website_items, -> { where(subtitle: 'Ruby on Rails') }

	after_initialize :set_defaults

	def set_defaults
		self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
		self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
	end
end

# def set_defaults
#		if self.main_image == nil
#			self.main_image = "http://placehold.it/600x400"
# end

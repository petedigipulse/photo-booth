class Photo < ActiveRecord::Base
	dragonfly_accessor :image

	validates :image, presence: true
	validates_size_of :image, maximum: 500.kilobytes, 
					message: 'Should be no more than 500kb', if: :image_changed?
	validates_property :format, of: :image, in: [:jpeg, :jpg, :png, :bmp], case_sensitive: false, message: 'Should be either .jpeg, .jpg, .png, .bmp', if: :image_changed?
					
	
end

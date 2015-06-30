class Photo < ActiveRecord::Base
	dragonfly_accessor :image

	validates :image, precence: true
	validates_size_of :image, maximum: 500.kilobytes, 
					message: 'Should be no more than 500kb' if: :image
	validate_property :format, of: :image, in: [:jpeg, :jpg, :png, :bmp], 
					message: 'Should be either . jpeg, .jpg, .png, .bmp', 
	
end

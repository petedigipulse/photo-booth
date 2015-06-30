class PhotosController < ApplicationController
	def new 
		@photos = Photo.order('created_at DESC')
		@photo = Photo.new
	end

	def create
		respond_to do |format|	
			@photo = Photo.new(photo_params)
			@photo.save
			format.html {redirect_to new_photo_path}
			format.js
		end	
	end

	def new_multiple
		@photos = Photo.order('created_at DESC')
		@photo = Photo.new
	end

	def photo_params
		params.require(:photo).permit(:image, :title, :author)
	end
end

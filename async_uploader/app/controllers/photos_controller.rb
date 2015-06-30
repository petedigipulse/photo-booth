class PhotosController < ApplicationController
	def new 
		@photos = Photo.order('created_at DESC')
		@photo = Photo.new
	end

	def create
		@photo = Photo.new(photo_params)
		@photo.save
		redirect_to new_photo_path
	end

	def photo_params
		params.require(:photo).permit(:image, :title)
	end
end

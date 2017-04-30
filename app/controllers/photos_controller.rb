class PhotosController < ApplicationController
  def create
    @place = Place.find(params[:place_id])
    @place.photos.create
    redirect_to place_path(@place)
  end 

  def photo_params
    params.require(:photo).permit(:caption, :place_id)
  end 
end

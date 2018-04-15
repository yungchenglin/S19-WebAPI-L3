class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
      if @photo.save
        redirect_to photos_url
      else
        render :action => :new
      end
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
      if @photo.update_attributes(photo_params)
        redirect_to photo_path(@photo)
     else
        render :action => :edit
     end
  end

  def destroy
  @photo = Photo.find(params[:id])
  @photo.destroy

  redirect_to photos_url
  end



  private

  def photo_params
    params.require(:photo).permit(:title, :date, :description, :file_location)
  end

end

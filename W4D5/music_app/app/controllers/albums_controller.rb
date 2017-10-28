class AlbumsController < ApplicationController
  before_action :require_logged_in, only: [:new, :create, :edit, :update, :destroy]

  def new
    @album = Album.new
    @bands = Band.all
    @band = Band.find(params[:band_id])
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def show
    @album = Album.find(params[:id])
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
  end

  private
  def album_params
    params.require(:album).permit(:title, :year, :band_id, :live)
  end
end

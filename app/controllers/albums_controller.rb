class AlbumsController < ApplicationController

  def show
    @artist = Artist.find(params[:artist_id])
    @explorer = current_explorer
    @album = Album.find(params[:id])
  end

  def new
    @artist = current_artist
    @album = Album.new()
  end

  def create
    @artist = current_artist
    @album = Album.new(album_params)
    @album.artist = @artist
    if @album.save
      redirect_to artist_album_path(@artist, @album)
    else
      render :new
    end
  end

  def edit
    @artist = current_artist
    @album = Album.find(params[:id])
  end

  def update
    @artist = current_artist
    @album = Album.find(params[:id])
    @album.update(album_params)

    redirect_to artist_album_path(@artist, @album)
  end

  def destroy
    @artist = current_artist
    @album = Album.find(params[:id])
    @album.destroy

    redirect_to dashboard_artist_path(@artist)
  end

  private

  def album_params
    params.require(:album).permit(:name, :meaning, :photo)
  end

end

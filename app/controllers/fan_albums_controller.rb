class FanAlbumsController < ApplicationController

  def create
    @explorer = current_explorer
    @album = Album.find(params[:album_id])
    @fan_album = FanAlbum.new(explorer: @explorer, album: @album)

    @fan_album.save!
    redirect_back(fallback_location: explorer_artist_album_path(@explorer, @album.artist, @album))
  end

  def destroy
    @explorer = current_explorer
    @album = Album.find(params[:album_id])
    @fan_album = FanAlbum.find(params[:id])

    @fan_album.destroy
    redirect_back(fallback_location: explorer_artist_album_path(@explorer, @album.artist, @album))
  end

end

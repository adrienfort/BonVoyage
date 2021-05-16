class FanAlbumsController < ApplicationController
  before_action :get_explorer_and_album, only: [:create, :destroy]

  def pundit_user
    current_explorer
  end

  def create
    @fan_album = FanAlbum.new(explorer: @explorer, album: @album)
    authorize @fan_album

    @fan_album.save!
    redirect_back(fallback_location: show_explorer_explorer_artist_album_path(@explorer, @album.artist, @album))
  end

  def destroy
    @fan_album = FanAlbum.find(params[:id])
    authorize @fan_album

    @fan_album.destroy
    redirect_back(fallback_location: show_explorer_explorer_artist_album_path(@explorer, @album.artist, @album))
  end

  private

  def get_explorer_and_album
    @explorer = current_explorer
    @album = Album.find(params[:album_id])
  end

end

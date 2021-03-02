class ExplorersController < ApplicationController

  def show
    @explorer = Explorer.find(params[:id])
    @artists = @explorer.artists
    @albums = @explorer.albums
    @playlists = @explorer.playlists
  end

end

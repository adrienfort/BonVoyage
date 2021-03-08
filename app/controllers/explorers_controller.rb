class ExplorersController < ApplicationController

  def dashboard
    @explorer = Explorer.find(params[:id])
    @artists = @explorer.artists
    @albums = @explorer.albums
    @playlists = @explorer.playlists
  end

end
